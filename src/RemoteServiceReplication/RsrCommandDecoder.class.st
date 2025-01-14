"
No class-specific documentation for RsrDecoder, hierarchy is:
Object
  RsrObject
    RsrCodec
      RsrDecoder( registry connection decodeCommandMap)

"
Class {
	#name : 'RsrCommandDecoder',
	#superclass : 'RsrCommandCodec',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrCommandDecoder class >> registry: aRegistry [

	^self new
		registry: aRegistry;
		yourself
]

{ #category : 'decoding-commands' }
RsrCommandDecoder >> decodeCommand: aStream [
	"Decode an object from the stream"

	| command |
	command := self decodeControlWord: aStream.
	command == self sendMessageCommand ifTrue: [^self decodeSendMessage: aStream].
	command == self deliverResponseCommand ifTrue: [^self decodeDeliverResponse: aStream].
	command == self releaseObjectsCommand ifTrue: [^self decodeReleaseServices: aStream].
	^RsrError signal: 'Unknown command identifier: ', command printString
]

{ #category : 'decoding-commands' }
RsrCommandDecoder >> decodeDeliverResponse: aStream [

    | transaction numServices serviceSnapshots response |
    transaction := self decodeControlWord: aStream.
    numServices := self decodeControlWord: aStream.
    serviceSnapshots := (1 to: numServices) collect: [:each | self decodeServiceSnapshot: aStream].
    response := self decodeReference: aStream.
    ^RsrDeliverResponse new
        transaction: transaction;
        snapshots: serviceSnapshots;
        response: response;
        yourself
]

{ #category : 'decoding-services' }
RsrCommandDecoder >> decodeImmediateReference: aStream [

	| referenceType |
	referenceType := self decodeControlWord: aStream.
	^(self instanceOfImmediate: referenceType)
		decode: aStream
		using: self
]

{ #category : 'decoding' }
RsrCommandDecoder >> decodeReference: aStream [

	| oid |
	oid := self decodeControlWord: aStream.
	oid = self immediateOID ifTrue: [^self decodeImmediateReference: aStream].
	^RsrServiceReference sid: oid
]

{ #category : 'decoding-commands' }
RsrCommandDecoder >> decodeReleaseServices: aStream [

	| count oids |
	count := self decodeControlWord: aStream.
	oids := Array new: count.
	1
		to: count
		do:
			[:i | | oid |
			oid := self decodeControlWord: aStream.
			oids at: i put: oid].
	^RsrReleaseServices sids: oids
]

{ #category : 'decoding-commands' }
RsrCommandDecoder >> decodeSendMessage: aStream [

	| transaction argCount receiverReference selector numServices serviceSnapshots arguments instance |
	transaction := self decodeControlWord: aStream.
	numServices := self decodeControlWord: aStream.
	serviceSnapshots := (1 to: numServices) collect: [:each | self decodeServiceSnapshot: aStream].
	receiverReference := self decodeReference: aStream.
	selector := self decodeReference: aStream.
	argCount := self decodeControlWord: aStream.
	arguments := (1 to: argCount) collect: [:each | self decodeReference: aStream].
	instance := RsrSendMessage
		transaction: transaction
		receiverReference: receiverReference
		selectorReference: selector
		argumentReferences: arguments.
	instance snapshots: serviceSnapshots.
	^instance
]

{ #category : 'decoding-services' }
RsrCommandDecoder >> decodeServiceSnapshot: aStream [

	| snapshot |
	snapshot := RsrServiceSnapshot new.
	snapshot
		decode: aStream
		using: self.
	^snapshot
]

{ #category : 'decoding-services' }
RsrCommandDecoder >> instanceOfImmediate: aReferenceType [

	aReferenceType = self symbolIdentifier
		ifTrue: [^RsrSymbolReference new].
	aReferenceType = self stringIdentifier
		ifTrue: [^RsrStringReference new].
	aReferenceType = self positiveIntegerIdentifier
		ifTrue: [^RsrPositiveIntegerReference new].
	aReferenceType = self negativeIntegerIdentifier
		ifTrue: [^RsrNegativeIntegerReference new].
	aReferenceType = self characterIdentifier
		ifTrue: [^RsrCharacterReference new].
	aReferenceType = self nilIdentifier
		ifTrue: [^RsrNilReference new].
	aReferenceType = self trueIdentifier
		ifTrue: [^RsrTrueReference new].
	aReferenceType = self falseIdentifier
		ifTrue: [^RsrFalseReference new].
	aReferenceType = self arrayIdentifier
		ifTrue: [^RsrArrayReference new].
	aReferenceType = self byteArrayIdentifier
		ifTrue: [^RsrByteArrayReference new].
	aReferenceType = self setIdentifier
		ifTrue: [^RsrSetReference new].
	aReferenceType = self orderedCollectionIdentifier
		ifTrue: [^RsrOrderedCollectionReference new].
	aReferenceType = self dictionaryIdentifier
		ifTrue: [^RsrDictionaryReference new].
	aReferenceType = self dateAndTimeIdentifier
		ifTrue: [^RsrDateAndTimeReference new].
	aReferenceType = self doubleIdentifier
		ifTrue: [^RsrDoubleReference new].
	self error: 'ReferenceType(', aReferenceType printString, ') not yet implemented'.
]
