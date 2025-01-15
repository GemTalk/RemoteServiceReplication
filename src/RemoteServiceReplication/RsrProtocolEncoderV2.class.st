Class {
	#name : 'RsrProtocolEncoderV2',
	#superclass : 'RsrProtocolEncoder',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeArrayReference: aArrayReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self arrayIdentifier
		onto: aStream.
	self
		encodeControlWord: aArrayReference intermediate size
		onto: aStream.
	aArrayReference intermediate
		do:
			[:each |
			each
				encode: aStream
				using: self]
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeByteArrayReference: aByteArrayReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self byteArrayIdentifier
		onto: aStream.
	self
		encodeControlWord: aByteArrayReference intermediate size
		onto: aStream.
	aStream nextPutAll: aByteArrayReference intermediate
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeCharacterReference: aCharacterReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self characterIdentifier
		onto: aStream.
	self
		encodeControlWord: aCharacterReference intermediate
		onto: aStream
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeDateAndTimeReference: aDateAndTimeReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self dateAndTimeIdentifier
		onto: aStream.
	self
		encodeControlWord: aDateAndTimeReference intermediate
		onto: aStream
]

{ #category : 'encoding-commands' }
RsrProtocolEncoderV2 >> encodeDeliverResponse: aDeliverResponse
onto: aStream [

	self
		encodeControlWord: self deliverResponseCommand
		onto: aStream.
	self
		encodeControlWord: aDeliverResponse transaction
		onto: aStream.
	self
		encodeControlWord: aDeliverResponse snapshots size
		onto: aStream.
	aDeliverResponse snapshots do: [:each | self encodeServiceSnapshot: each onto: aStream].
	self
		encodeReference: aDeliverResponse response
		onto: aStream
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeDictionaryReference: aDictionaryReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self dictionaryIdentifier
		onto: aStream.
	self
		encodeControlWord: aDictionaryReference intermediate size / 2
		onto: aStream.
	aDictionaryReference intermediate do: [:each | each encode: aStream using: self]
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeDoubleReference: aDoubleReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self doubleIdentifier
		onto: aStream.
	aStream nextPutAll: aDoubleReference intermediate
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeFalseReference: aFalseReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self falseIdentifier
		onto: aStream
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeNegativeIntegerReference: aNegativeIntegerReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self negativeIntegerIdentifier
		onto: aStream.
	self
		encodeControlWord: aNegativeIntegerReference intermediate size
		onto: aStream.
	aStream nextPutAll: aNegativeIntegerReference intermediate
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeNilReference: aNilReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self nilIdentifier
		onto: aStream
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeOrderedCollectionReference: anOrderedCollectionReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self orderedCollectionIdentifier
		onto: aStream.
	self
		encodeControlWord: anOrderedCollectionReference intermediate size
		onto: aStream.
	anOrderedCollectionReference intermediate
		do:
			[:each |
			each
				encode: aStream
				using: self]
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodePositiveIntegerReference: aPositiveIntegerReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self positiveIntegerIdentifier
		onto: aStream.
	self
		encodeControlWord: aPositiveIntegerReference intermediate size
		onto: aStream.
	aStream nextPutAll: aPositiveIntegerReference intermediate
]

{ #category : 'encoding-commands' }
RsrProtocolEncoderV2 >> encodeReference: aReference
onto: aStream [

	aReference
		encode: aStream
		using: self
]

{ #category : 'encoding-commands' }
RsrProtocolEncoderV2 >> encodeReleaseServices: aReleaseServices
onto: aStream [

	self
		encodeControlWord: self releaseObjectsCommand
		onto: aStream.
	self
		encodeControlWord: aReleaseServices sids size
		onto: aStream.
	aReleaseServices sids
		do:
			[:sid |
			self
				encodeControlWord: sid
				onto: aStream]
]

{ #category : 'encoding-commands' }
RsrProtocolEncoderV2 >> encodeSendMessage: aSendMessage
onto: aStream [

	self
		encodeControlWord: self sendMessageCommand
		onto: aStream.
	self
		encodeControlWord: aSendMessage transaction
		onto: aStream.
	self
		encodeControlWord: aSendMessage snapshots size
		onto: aStream.
	aSendMessage snapshots
		do:
			[:each |
			self
				encodeServiceSnapshot: each
				onto: aStream].
	self
		encodeReference:  aSendMessage receiverReference
		onto: aStream.
	self
		encodeReference: aSendMessage selectorReference
		onto: aStream.
	self
		encodeControlWord: aSendMessage argumentReferences size
		onto: aStream.
	aSendMessage argumentReferences
		do:
			[:each |
			self
				encodeReference: each
				onto: aStream]
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeServiceReference: aServiceReference
onto: aStream [

	self
		encodeControlWord: aServiceReference sid
		onto: aStream
]

{ #category : 'encoding-snapshots' }
RsrProtocolEncoderV2 >> encodeServiceSnapshot: aServiceSnapshot
onto: aStream [

	self
		encodeControlWord: self snapshotIdentifier
		onto: aStream.
	self
		encodeControlWord: aServiceSnapshot sid
		onto: aStream.
	self
		encodeControlWord: aServiceSnapshot slots size
		onto: aStream.
	aServiceSnapshot templateNameReference
		encode: aStream
		using: self.
	aServiceSnapshot personaReference
		encode: aStream
		using: self.
	aServiceSnapshot slots do: [:each | each encode: aStream using: self]
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeSetReference: aSetReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self setIdentifier
		onto: aStream.
	self
		encodeControlWord: aSetReference intermediate size
		onto: aStream.
	aSetReference intermediate
		do:
			[:each |
			each
				encode: aStream
				using: self]
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeStringReference: aStringReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self stringIdentifier
		onto: aStream.
	self
		encodeControlWord: aStringReference intermediate size
		onto: aStream.
	aStream nextPutAll: aStringReference intermediate
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeSymbolReference: aSymbolReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self symbolIdentifier
		onto: aStream.
	self
		encodeControlWord: aSymbolReference intermediate size
		onto: aStream.
	aStream nextPutAll: aSymbolReference intermediate
]

{ #category : 'encoding-references' }
RsrProtocolEncoderV2 >> encodeTrueReference: aTrueReference
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self trueIdentifier
		onto: aStream
]
