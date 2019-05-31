Class {
	#name : #RsrDecoder,
	#superclass : #RsrCodec,
	#instVars : [
		'registry',
		'connection'
	],
	#category : #'RemoteServiceReplication-Communications'
}

{ #category : #'instance creation' }
RsrDecoder class >> registry: anRsrRegistry
connection: aConnection [

	^self new
		registry: anRsrRegistry;
		connection: aConnection;
		yourself
]

{ #category : #accessing }
RsrDecoder >> connection [

	^connection
]

{ #category : #accessing }
RsrDecoder >> connection: aConnection [

	connection := aConnection
]

{ #category : #decoding }
RsrDecoder >> decodeArray: aStream [

	| oid size array |
	oid := self decodeControlWord: aStream.
	size := self decodeControlWord: aStream.
	array := registry
		at: oid
		ifAbsent:
			[(RsrArray new: size)
				rsrId: oid;
				rsrConnection: self connection;
				yourself].
	array registerWith: self registry.
	1 to: size do: [:i | array at: i put: (self decodeObjectReference: aStream)].
	^array
]

{ #category : #decoding }
RsrDecoder >> decodeCharacter: aStream [

	| codePoint |
	codePoint := self decodeControlWord: aStream.
	^Character codePoint: codePoint
]

{ #category : #decoding }
RsrDecoder >> decodeCommand: aStream [
	"Decode an object from the stream"

	| command |
	command := self decodeControlWord: aStream.
	command == self retainObjectCommand
		ifTrue: [^RsrRetainObject object: (self decodeObject: aStream)].
	command == self sendMessageCommand
		ifTrue: [^self decodeSendMessage: aStream].
	command == self deliverResponseCommand
		ifTrue: [^self decodeDeliverResponse: aStream].
	command == self releaseObjectsCommand
		ifTrue: [^self decodeReleaseObjects: aStream].
	self error: 'Invalid message'
]

{ #category : #decoding }
RsrDecoder >> decodeControlWord: aStream [

	| bytes unsignedResult |
	bytes := aStream next: self sizeOfInteger.
	unsignedResult := bytes asInteger.
	^unsignedResult > self controlWordMax
		ifTrue: [(2 raisedTo: 64) negated + unsignedResult]
		ifFalse: [unsignedResult]
]

{ #category : #decoding }
RsrDecoder >> decodeDeliverResponse: aStream [

	| transaction response |
	transaction := self decodeControlWord: aStream.
	response := self decodeObjectReference: aStream.
	^RsrDeliverResponse
		transaction: transaction
		response: response
]

{ #category : #decoding }
RsrDecoder >> decodeImmediateInteger: aStream [

	| length bytes |
	length := self decodeControlWord: aStream.
	bytes := aStream next: length.
	^bytes asInteger
]

{ #category : #decoding }
RsrDecoder >> decodeImmediateObject: aStream [

	| type |
	type := self decodeControlWord: aStream.
	type = self symbolType
		ifTrue: [^self decodeSymbol: aStream].
	type = self stringType
		ifTrue: [^self decodeString: aStream].
	type = self positiveIntegerType
		ifTrue: [^self decodeImmediateInteger: aStream].
	type = self negativeIntegerType
		ifTrue: [^self decodeNegativeInteger: aStream].
	type = self characterType
		ifTrue: [^self decodeCharacter: aStream].
	type = self nilType
		ifTrue: [^nil].
	type = self trueType
		ifTrue: [^true].
	type = self falseType
		ifTrue: [^false].
	self error: 'Invalid immediate type specified (', type printString, ')'
]

{ #category : #decoding }
RsrDecoder >> decodeInteger: aStream [

	| length bytes |
	length := self decodeControlWord: aStream.
	bytes := aStream next: length.
	^bytes asInteger
]

{ #category : #decoding }
RsrDecoder >> decodeNegativeInteger: aStream [

	^(self decodeImmediateInteger: aStream) negated
]

{ #category : #decoding }
RsrDecoder >> decodeObject: aStream [

	| objectType |
	objectType := self decodeControlWord: aStream.
	objectType = self serviceType
		ifTrue: [^self decodeService: aStream].
	objectType = self arrayType
		ifTrue: [^self decodeArray: aStream].
	^self error: 'Invalid object'
]

{ #category : #decoding }
RsrDecoder >> decodeObjectReference: aStream [

	| oid |
	oid := self decodeControlWord: aStream.
	oid = 0 ifTrue: [^self decodeImmediateObject: aStream].
	^registry at: oid ifAbsent: [self signalUnknownOID]
]

{ #category : #decoding }
RsrDecoder >> decodeReleaseObjects: aStream [

	| count oids |
	count := self decodeControlWord: aStream.
	oids := Array new: count.
	1
		to: count
		do:
			[:i | | oid |
			oid := self decodeControlWord: aStream.
			oids at: i put: oid].
	^RsrReleaseObjects oids: oids
]

{ #category : #decoding }
RsrDecoder >> decodeSendMessage: aStream [

	| transaction argCount receiverOID receiver selector arguments |
	transaction := self decodeControlWord: aStream.
	argCount := self decodeControlWord: aStream.
	receiverOID := self decodeControlWord: aStream.
	receiver := registry at: receiverOID ifAbsent: [^self signalUnknownOID].
	selector := self decodeObjectReference: aStream.
	arguments := (1 to: argCount) collect: [:each | self decodeObjectReference: aStream].
	^RsrSendMessage
		transaction: transaction
		receiver: receiver
		selector: selector
		arguments: arguments
]

{ #category : #decoding }
RsrDecoder >> decodeService: aStream [

	| oid instVarCount serviceName instance |
	oid := self decodeControlWord: aStream.
	instVarCount := self decodeControlWord: aStream.
	serviceName := self decodeObjectReference: aStream.
	instance := registry
		at: oid
		ifAbsent:
			[((self lookupClass: serviceName)
				rsrId: oid
				rsrConnection: self connection)
					yourself].
	instance registerWith: self registry.
	(self reflectedVariableNamesOf: instance) size = instVarCount
		ifFalse: [self error: 'Incorrectly encoded instance detected'].
	self
		reflectedVariableNamesOf: instance
		do: [:name | instance instVarNamed: name put: (self decodeObjectReference: aStream)].
	^instance
]

{ #category : #decoding }
RsrDecoder >> decodeString: aStream [

	| length bytes |
	length := self decodeControlWord: aStream.
	bytes := aStream next: length.
	^bytes utf8Decoded
]

{ #category : #decoding }
RsrDecoder >> decodeSymbol: aStream [

	^(self decodeString: aStream) asSymbol
]

{ #category : #utility }
RsrDecoder >> lookupClass: aClassName [

	^Smalltalk at: aClassName
]

{ #category : #accessing }
RsrDecoder >> registry [

	^registry
]

{ #category : #accessing }
RsrDecoder >> registry: anRsrRegistry [

	registry := anRsrRegistry
]

{ #category : #'error handling' }
RsrDecoder >> signalUnknownOID [

	RsrUnknownOID signal
]