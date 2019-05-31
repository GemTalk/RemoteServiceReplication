Class {
	#name : #RsrEncoder,
	#superclass : #RsrCodec,
	#category : #'RemoteServiceReplication-Communications'
}

{ #category : #'private-encoding' }
RsrEncoder >> encodeArray: anArray
on: aStream [

	self
		encodeControlWord: self arrayType
		onto: aStream.
	self
		encodeControlWord: anArray rsrId
		onto: aStream.
	self
		encodeControlWord: anArray size
		onto: aStream.
	anArray
		do:
			[:each |
			self
				encodeReferenceOf: each
				onto: aStream]
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeCharacter: aCharacter
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self characterType
		onto: aStream.
	self
		encodeControlWord: aCharacter codePoint
		onto: aStream
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeControlWord: anInteger
onto: aStream [

	| encodedBytes |
	(anInteger between: self controlWordMin and: self controlWordMax)
		ifFalse: [self error: anInteger printString, ' is outside the supported size of a control word.'].
	encodedBytes := (anInteger positive
		ifTrue: [anInteger]
		ifFalse: [(2 raisedTo: 64) + anInteger]) asByteArrayOfSize: self sizeOfInteger.
	aStream nextPutAll: encodedBytes
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeDeliverResponse: aDeliverResponse [

	^ByteArray
		streamContents:
			[:stream |
			self
				encodeControlWord: self deliverResponseCommand
				onto: stream.
			self
				encodeControlWord: aDeliverResponse transaction
				onto: stream.
			self
				encodeReferenceOf: aDeliverResponse response
				onto: stream]
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeFalseOnto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self falseType
		onto: aStream
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeImmediate: anImmediate
onto: aStream [

	anImmediate isSymbol
		ifTrue:
			[^self
				encodeSymbol: anImmediate
				onto: aStream].
	anImmediate isString
		ifTrue:
			[^self
				encodeString: anImmediate
				onto: aStream].
	anImmediate isInteger
		ifTrue:
			[^self
				encodeImmediateInteger: anImmediate
				onto: aStream].
	anImmediate isCharacter
		ifTrue:
			[^self
				encodeCharacter: anImmediate
				onto: aStream].
	anImmediate == nil
		ifTrue:
			[^self encodeNilOnto: aStream].
	anImmediate == true
		ifTrue:
			[^self encodeTrueOnto: aStream].
	anImmediate == false
		ifTrue:
			[^self encodeFalseOnto: aStream].
	self error: 'Unsupported Immediate'
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeImmediateInteger: anInteger
onto: aStream [

	| bytes immediateType |
	immediateType := anInteger positive
		ifTrue: [self positiveIntegerType]
		ifFalse: [self negativeIntegerType].
	bytes := anInteger asByteArray.
	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: immediateType
		onto: aStream.
	self
		encodeControlWord: bytes size
		onto: aStream.
	aStream nextPutAll: bytes
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeNilOnto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self nilType
		onto: aStream
]

{ #category : #encoding }
RsrEncoder >> encodeObject: anObject [

	^ByteArray
		streamContents:
			[:stream |
			self
				encodeObject: anObject
				onto: stream]
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeObject: anObject
onto: aStream [

	(self isService: anObject)
		ifTrue: [^self encodeService: anObject on: aStream].
	(self isArray: anObject)
		ifTrue: [^self encodeArray: anObject on: aStream].
	self error: 'Unable to encode: ', anObject printString
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeReferenceOf: anObject
onto: aStream [

	(self isRsrObject: anObject)
		ifTrue: [^self encodeControlWord: anObject rsrId onto: aStream].
	(self isImmediate: anObject)
		ifTrue: [^self encodeImmediate: anObject onto: aStream].
	self error: 'Unsupported type'
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeReleaseObjects: aReleaseObject [

	^ByteArray
		streamContents:
			[:stream |
			self
				encodeControlWord: self releaseObjectsCommand
				onto: stream.
			self
				encodeControlWord: aReleaseObject oids size
				onto: stream.
			aReleaseObject oids
				do:
					[:oid |
					self
						encodeControlWord: oid
						onto: stream]]
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeRetainObject: aRetainObject [

	^ByteArray
		streamContents:
			[:stream |
			self
				encodeControlWord: self retainObjectIdentifier
				onto: stream.
			self
				encodeObject: aRetainObject object
				onto: stream]
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeSendMessage: aSendMessage [

	^ByteArray
		streamContents:
			[:stream |
			self
				encodeControlWord: self sendMessageIdentifier
				onto: stream.
			self
				encodeControlWord: aSendMessage transaction
				onto: stream.
			self
				encodeControlWord: aSendMessage arguments size
				onto: stream.
			self
				encodeReferenceOf: aSendMessage receiver
				onto: stream.
			self
				encodeReferenceOf: aSendMessage selector
				onto: stream.
			aSendMessage arguments
				do:
					[:each |
					self
						encodeReferenceOf: each
						onto: stream]]
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeService: aService
on: aStream [

	"type"
	"the OID for the object"
	"the name of the remote service to create"
	"Write the object slots"
	| reflectedVariables |
	reflectedVariables := self reflectedVariableNamesOf: aService.
	self
		encodeControlWord: self serviceType
		onto: aStream.
	self
		encodeControlWord: aService rsrId
		onto: aStream.
	self
		encodeControlWord: reflectedVariables size
		onto: aStream.
	self
		encodeSymbol: aService remoteServiceName
		onto: aStream.
	self
		reflectedVariablesOf: aService
		do: [:each | self encodeReferenceOf: each onto: aStream]
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeString: aString
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self stringType
		onto: aStream.
	self
		encodeStringBody: aString
		onto: aStream
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeStringBody: aString
onto: aStream [

	| bytes |
	bytes := aString utf8Encoded.
	self
		encodeControlWord: bytes size
		onto: aStream.
	aStream nextPutAll: bytes
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeSymbol: aSymbol
onto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self symbolType
		onto: aStream.
	self
		encodeStringBody: aSymbol
		onto: aStream
]

{ #category : #'private-encoding' }
RsrEncoder >> encodeTrueOnto: aStream [

	self
		encodeControlWord: self immediateOID
		onto: aStream.
	self
		encodeControlWord: self trueType
		onto: aStream
]

{ #category : #'private-accessing' }
RsrEncoder >> immediateOID [

	^0
]

{ #category : #'private-testing' }
RsrEncoder >> isArray: anObject [

	^anObject isKindOf: RsrArray
]

{ #category : #'private-testing' }
RsrEncoder >> isRsrObject: anObject [

	^anObject isKindOf: RsrObject
]

{ #category : #'private-testing' }
RsrEncoder >> isService: anObject [

	^anObject isKindOf: RsrService
]

{ #category : #'private-encoding' }
RsrEncoder >> reflectedVariablesOf: anRsrObject
do: aBlock [

	(self reflectedVariableNamesOf: anRsrObject)
		do:
			[:name |
			aBlock value: (anRsrObject instVarNamed: name)]
]

{ #category : #'private-accessing' }
RsrEncoder >> retainObjectIdentifier [

	^0
]

{ #category : #'private-accessing' }
RsrEncoder >> sendMessageIdentifier [

	^1
]