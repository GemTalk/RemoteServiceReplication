"
No class-specific documentation for RsrDecoderTest, hierarchy is:
Object
  TestAsserter
    TestCase( testSelector)
      RsrTestCase
        RsrCodecTest( registry decoder)
          RsrDecoderTest

"
Class {
	#name : 'RsrCommandDecoderTest',
	#superclass : 'RsrCommandCodecTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'asserting' }
RsrCommandDecoderTest >> assertReference: bytes
decodesTo: expected [

	| actual |
	actual := self decodeReference: bytes.
	self
		assert: actual
		equals: expected
]

{ #category : 'decoding' }
RsrCommandDecoderTest >> decodeReference: bytes [

	^(self decoder decodeReference: bytes readStream) resolve: self connection
]

{ #category : 'decoding' }
RsrCommandDecoderTest >> decodeService: anObjectBytes [

	^(self decoder decodeServiceSnapshot: anObjectBytes readStream) reifyIn: self connection
]

{ #category : 'running' }
RsrCommandDecoderTest >> testDeliverResponse [

	| service response encoding command decodedService |
	service := RsrServerNoInstVars new.
	self connection _ensureRegistered: service.
	response := #responseSymbol.
	encoding :=
		#[0 0 0 0 0 0 0 2], "DeliverResponse Command"
		#[0 0 0 0 0 0 0 1], "Transaction Id"
		#[0 0 0 0 0 0 0 1], "Number of services"
		self serviceNoInstVarsEncoding,
		#[0 0 0 0 0 0 0 0], "Service Name Symbol Reference"
		#[0 0 0 0 0 0 0 1], "Object Type for Symbol"
		#[0 0 0 0 0 0 0 14], "Length of UTF-8 bytes"
		#[114 101 115 112 111 110 115 101 83 121 109 98 111 108]. "#responseSymbol"
	command := self decoder decodeCommand: encoding readStream.
	self
		assert: command class
		equals: RsrDeliverResponse.
	self
		assert: command transaction
		equals: 1.
	self
		assert: command snapshots size
		equals: 1.
	decodedService := command snapshots first reifyIn: self connection.
	self
		assert: decodedService
		equals: service.
	self
		assert: (command response resolve: self connection)
		equals: response
]

{ #category : 'running' }
RsrCommandDecoderTest >> testReleaseServices [

	| command encoding |
	encoding :=
		#[0 0 0 0 0 0 0 3], "ReleaseObjects Command"
		#[0 0 0 0 0 0 0 5], "Num OIDS"
		#[0 0 0 0 0 0 0 1], "First OID"
		#[0 0 0 0 0 0 0 2],
		#[0 0 0 0 0 0 0 3],
		#[0 0 0 0 0 0 0 4],
		#[0 0 0 0 0 0 0 5]. "Last OID"
	command := self decoder decodeCommand: encoding readStream.
	self
		assert: command sids
		equals: #(1 2 3 4 5)
]

{ #category : 'running' }
RsrCommandDecoderTest >> testSendMessage [

	| service encoding command |
	service := RsrServerNoInstVars new.
	self connection _ensureRegistered: service.
	encoding :=
		#[0 0 0 0 0 0 0 1], "SendMessage Command"
		#[0 0 0 0 0 0 0 1], "Transaction ID"
		#[0 0 0 0 0 0 0 1], "One service is part of this message"
		self serviceNoInstVarsEncoding,
		#[0 0 0 0 0 0 0 1], "Receiver OID"
		#[0 0 0 0 0 0 0 0], "Selector Reference"
		#[0 0 0 0 0 0 0 1], "Object Type for Symbol"
		#[0 0 0 0 0 0 0 8], "Length of UTF-8 bytes"
		#[114 101 116 117 114 110 52 50], "#return42"
		#[0 0 0 0 0 0 0 0]. "Argument Count"
	command := self decoder decodeCommand: encoding readStream.
	self
		assert: command class
		equals: RsrSendMessage.
	self
		assert: command transaction
		equals: 1.
	self
		assert: (command receiverReference resolve: self connection)
		identicalTo: service.
	self
		assert: (command selectorReference resolve: self connection)
		identicalTo: #return42.
	self
		assert: command argumentReferences
		equals: #().
	self
		assert: command snapshots size
		equals: 1
]

{ #category : 'running' }
RsrCommandDecoderTest >> testServiceDecodeIdentity [
	"Ensure that decoding an object multiple times results in
	a single object getting created."

	| firstService secondService |
	firstService := self decodeService: self serviceNoInstVarsEncoding.
	secondService := self decodeService: self serviceNoInstVarsEncoding.
	self
		assert: firstService
		identicalTo: secondService
]

{ #category : 'running' }
RsrCommandDecoderTest >> testServiceNoInstVars [

	| decodedService |
	decodedService := self decodeService: self serviceNoInstVarsEncoding.
	self
		assert: decodedService class
		equals: RsrServerNoInstVars.
	self
		assert: decodedService _id
		equals: 1
]

{ #category : 'running' }
RsrCommandDecoderTest >> testServiceReferenceService [

	| rootService referencedService |
	referencedService := self decodeService: self referencedServiceEncoding.
	self
		assert: referencedService class
		equals: RsrServerNoInstVars.
	self
		assert: referencedService _id
		equals: 2.
	rootService := self decodeService: self rootServiceEncoding.
	self
		assert: rootService class
		equals: RsrServerReferenceService.
	self
		assert: rootService service
		equals: referencedService
]

{ #category : 'asserting' }
RsrCommandDecoderTest >> verifyControlWord: expected
encoding: bytes [

	| actual |
	actual := self decoder decodeControlWord: bytes readStream.
	self
		assert: actual
		equals: expected
]

{ #category : 'asserting' }
RsrCommandDecoderTest >> verifyImmediate: expected
encoding: encoding [

	| actual |
	actual := (self decoder decodeReference: encoding readStream) resolve: self connection.
	self
		assert: actual
		equals: expected
]
