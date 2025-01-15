Class {
	#name : 'RsrProtocolDecoderTest',
	#superclass : 'RsrProtocolCodecTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'testing' }
RsrProtocolDecoderTest class >> isAbstract [

	^self == RsrProtocolDecoderTest
]

{ #category : 'asserting' }
RsrProtocolDecoderTest >> assertReference: bytes
decodesTo: expected [

	| actual |
	actual := self decodeReference: bytes.
	self
		assert: actual
		equals: expected
]

{ #category : 'decoding' }
RsrProtocolDecoderTest >> decodeReference: bytes [

	^(self decoder decodeReference: bytes readStream) resolve: self connection
]

{ #category : 'decoding' }
RsrProtocolDecoderTest >> decodeService: anObjectBytes [

	^(self decoder decodeServiceSnapshot: anObjectBytes readStream) reifyIn: self connection
]

{ #category : 'running' }
RsrProtocolDecoderTest >> testDecodeIncompatibleServiceWithExtraInstVar [
	"Ensure that there is a reasonable error message when decoding failes due to incompatible templates."

	| encoding exception |
	encoding := 	#[0 0 0 0 0 0 0 0], "type"
	#[0 0 0 0 0 0 0 1], "referencedService's OID = 1"
	#[0 0 0 0 0 0 0 1], "Inst Var Count"
	#[0 0 0 0 0 0 0 0], "Start of service name. OID = 0"
	#[0 0 0 0 0 0 0 1], "Service name = 1 -> Symbol"
	#[0 0 0 0 0 0 0 20], "Length of UTF-8 encoded bytes"
	#[82 115 114 83 101 114 118 105 99 101 78 111 73 110 115 116 86 97 114 115], "#RsrServiceNoInstVars"
	#[0 0 0 0 0 0 0 0], "Start of persona. OID = 0"
	#[0 0 0 0 0 0 0 1], "Service name = 1 -> Symbol"
	#[0 0 0 0 0 0 0 6], "Length of UTF-8 encoded bytes"
	#[115 101 114 118 101 114], "#server"
	"inst var referencing itself"
	#[0 0 0 0 0 0 0 1].
	exception := [self decodeService: encoding]
		on: Error
		do: [:ex | ex return: ex].
	self
		assert: exception messageText
		equals: 'Expected 0 value(s) for template RsrServiceNoInstVars but received 1 value(s) instead. Verify peers have compatible template definitions.'
]

{ #category : 'running' }
RsrProtocolDecoderTest >> testDeliverResponse [

	| service response encoding command decodedService |
	service := RsrServerNoInstVars new.
	self connection _ensureRegistered: service.
	response := #responseSymbol.
	encoding :=
		#[0 0 0 0 0 0 0 2], "DeliverResponse Command"
		#[0 0 0 0 0 0 0 1], "Transaction Id"
		#[0 0 0 0 0 0 0 1], "Number of services"
		self serviceNoInstVarsServerPersonaEncoding,
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
RsrProtocolDecoderTest >> testReleaseServices [

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
RsrProtocolDecoderTest >> testSendMessage [

	| service encoding command |
	service := RsrServerNoInstVars new.
	self connection _ensureRegistered: service.
	encoding :=
		#[0 0 0 0 0 0 0 1], "SendMessage Command"
		#[0 0 0 0 0 0 0 1], "Transaction ID"
		#[0 0 0 0 0 0 0 1], "One service is part of this message"
		self serviceNoInstVarsServerPersonaEncoding,
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
RsrProtocolDecoderTest >> testServiceDecodeIdentity [
	"Ensure that decoding an object multiple times results in
	a single object getting created."

	| firstService secondService |
	firstService := self decodeService: self serviceNoInstVarsServerPersonaEncoding.
	secondService := self decodeService: self serviceNoInstVarsServerPersonaEncoding.
	self
		assert: firstService
		identicalTo: secondService
]

{ #category : 'running' }
RsrProtocolDecoderTest >> testServiceNoInstVars [

	| decodedService |
	decodedService := self decodeService: self serviceNoInstVarsServerPersonaEncoding.
	self
		assert: decodedService class
		equals: RsrServerNoInstVars.
	self
		assert: decodedService _id
		equals: 1
]

{ #category : 'running' }
RsrProtocolDecoderTest >> testServiceReferenceService [

	| rootService referencedService |
	referencedService := self decodeService: self serviceNoInstVarsServerPersonaEncoding.
	self
		assert: referencedService class
		equals: RsrServerNoInstVars.
	self
		assert: referencedService _id
		equals: 1.
	rootService := self decodeService: self serviceReferenceServiceServerPersonaEncoding.
	self
		assert: rootService class
		equals: RsrServerReferenceService.
	self
		assert: rootService _id
		equals: 2.
	self
		assert: rootService service
		equals: referencedService
]

{ #category : 'asserting' }
RsrProtocolDecoderTest >> verifyControlWord: expected
encoding: bytes [

	| actual |
	actual := self decoder decodeControlWord: bytes readStream.
	self
		assert: actual
		equals: expected
]

{ #category : 'asserting' }
RsrProtocolDecoderTest >> verifyImmediate: expected
encoding: encoding [

	| actual |
	actual := (self decoder decodeReference: encoding readStream) resolve: self connection.
	self
		assert: actual
		equals: expected
]
