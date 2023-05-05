"
No class-specific documentation for RsrEncoderTest, hierarchy is:
Object
  TestAsserter
    TestCase( testSelector)
      RsrTestCase
        RsrCodecTest( registry decoder)
          RsrEncoderTest( connection)

"
Class {
	#name : 'RsrCommandEncoderTest',
	#superclass : 'RsrCommandCodecTest',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'other' }
RsrCommandEncoderTest >> register: aService [

	self rsrSession _ensureRegistered: aService
]

{ #category : 'running-immediates' }
RsrCommandEncoderTest >> testDeliverResponse [

	| service response command result expectedEncoding |
	service := RsrClientNoInstVars new.
	self register: service.
	response := #responseSymbol.
	command := RsrDeliverResponse
		transaction: 1
		responseReference: (RsrReference from: response)
		snapshots: (Array with: (RsrServiceSnapshot from: service)).
	result := self encoder encodeDeliverResponse: command.
	expectedEncoding :=
		#[0 0 0 0 0 0 0 2], "DeliverResponse Command"
		#[0 0 0 0 0 0 0 1], "Transaction Id"
		#[0 0 0 0 0 0 0 1], "One service is part of this response"
		self serviceNoInstVarsEncoding,
		#[0 0 0 0 0 0 0 0], "Service Name Symbol Reference"
		#[0 0 0 0 0 0 0 1], "Object Type for Symbol"
		#[0 0 0 0 0 0 0 14], "Length of UTF-8 bytes"
		#[114 101 115 112 111 110 115 101 83 121 109 98 111 108]. "#responseSymbol"
	self
		assert: result
		equals: expectedEncoding
]

{ #category : 'running' }
RsrCommandEncoderTest >> testNaN [

	| encoding |
	"Signaling NaN is not tested.
	Negative NaN is not tested."
	encoding :=
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 15],
		#[255 248 0 0 0 0 0 0].
	self
		verifyImmediate: RsrDoubleReference nan
		encoding: encoding.
]

{ #category : 'running-immediates' }
RsrCommandEncoderTest >> testReleaseServices [

	| command result expectedEncoding |
	command := RsrReleaseServices sids: #(1 2 3 4 5).
	result := self encoder encodeReleaseServices: command.
	expectedEncoding :=
		#[0 0 0 0 0 0 0 3], "ReleaseObjects Command"
		#[0 0 0 0 0 0 0 5], "Num OIDS"
		#[0 0 0 0 0 0 0 1], "First OID"
		#[0 0 0 0 0 0 0 2],
		#[0 0 0 0 0 0 0 3],
		#[0 0 0 0 0 0 0 4],
		#[0 0 0 0 0 0 0 5]. "Last OID"
	self
		assert: result
		equals: expectedEncoding
]

{ #category : 'running-immediates' }
RsrCommandEncoderTest >> testSendMessage [

	| service analysis command result expectedEncoding |
	service := RsrClientNoInstVars new.
	self register: service.
	analysis := RsrSnapshotAnalysis
		roots: (Array with: service)
		connection: self rsrSession.
	analysis perform.
	command := RsrSendMessage
		transaction: 1
		receiverReference: (RsrReference from: service)
		selectorReference: (RsrSymbolReference from: #return42)
		argumentReferences: #().
	command snapshots: analysis snapshots.
	result := self encoder encodeSendMessage: command.
	expectedEncoding :=
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
	self
		assert: result
		equals: expectedEncoding
]

{ #category : 'running' }
RsrCommandEncoderTest >> testServiceNoInstVars [

	| rootService encodedBytes expectedEncoding |
	rootService := RsrClientNoInstVars new.
	self register: rootService.
	encodedBytes := self encoder encodeServiceSnapshot: (RsrServiceSnapshot from: rootService).
	expectedEncoding := self serviceNoInstVarsEncoding.
	self
		assert: encodedBytes
		equals: expectedEncoding
]

{ #category : 'running' }
RsrCommandEncoderTest >> testServiceReferenceService [

	| rootService referencedService encodedObject expectedEncoding |
	referencedService := RsrClientNoInstVars new.
	rootService := RsrClientReferenceService service: referencedService.
	self
		register: rootService;
		register: referencedService.
	encodedObject := self encoder encodeServiceSnapshot: (RsrServiceSnapshot from: rootService).
	expectedEncoding :=
		#[0 0 0 0 0 0 0 0], "type"
		#[0 0 0 0 0 0 0 1], "rootService's OID = 1"
		#[0 0 0 0 0 0 0 1], "Inst Var Count"
		#[0 0 0 0 0 0 0 0], "Start of service name. OID = 0"
		#[0 0 0 0 0 0 0 1], "Service name = 1 -> Symbol"
		#[0 0 0 0 0 0 0 25], "Length of UTF-8 encoded bytes"
		#[82 115 114 83 101 114 118 101 114 82 101 102 101 114 101 110 99 101 83 101 114 118 105 99 101],
		#[0 0 0 0 0 0 0 2]. "#RsrServerReferenceService"
	self
		assert: encodedObject
		equals: expectedEncoding.
	encodedObject := self encoder encodeServiceSnapshot: (RsrServiceSnapshot from: referencedService).
	expectedEncoding :=
		#[0 0 0 0 0 0 0 0], "type"
		#[0 0 0 0 0 0 0 2], "referencedService's OID = 2"
		#[0 0 0 0 0 0 0 0], "Inst Var Count"
		#[0 0 0 0 0 0 0 0], "Start of service name. OID = 0"
		#[0 0 0 0 0 0 0 1], "Service name = 1 -> Symbol"
		#[0 0 0 0 0 0 0 19], "Length of UTF-8 encoded bytes"
		#[82 115 114 83 101 114 118 101 114 78 111 73 110 115 116 86 97 114 115]. "#RsrServerNoInstVars"
	self
		assert: encodedObject
		equals: expectedEncoding
]

{ #category : 'running' }
RsrCommandEncoderTest >> testUnsupportedObject [

	self
		should: [self encoder encodeReference: (RsrReference from: Object new) onto: (WriteStream on: ByteArray new)]
		raise: RsrUnsupportedObject
]

{ #category : 'running-immediates' }
RsrCommandEncoderTest >> verifyControlWord: anInteger
encoding: expected [

	| actual |
	actual := ByteArray streamContents: [:stream | self encoder encodeControlWord: anInteger onto: stream].
	self
		assert: actual
		equals: expected
]

{ #category : 'running-immediates' }
RsrCommandEncoderTest >> verifyImmediate: anObject
encoding: expected [

	| actual |
	actual := ByteArray streamContents: [:stream | self encoder encodeReference: (RsrReference from: anObject) onto: stream].
	self
		assert: actual
		equals: expected
]
