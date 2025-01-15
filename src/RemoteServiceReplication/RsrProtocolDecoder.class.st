Class {
	#name : 'RsrProtocolDecoder',
	#superclass : 'RsrProtocolCodec',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeByteArrayReference: aByteArrayReference
from: aStream [

	| length |
	length := self decodeControlWord: aStream.
	aByteArrayReference intermediate: (aStream next: length)
]

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeCharacterArrayReference: aCharacterArrayReference
from: aStream [

	| length |
	length := self decodeControlWord: aStream.
	aCharacterArrayReference intermediate: (aStream next: length)
]

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeCharacterReference: aCharacterReference
from: aStream [

	aCharacterReference intermediate: (self decodeControlWord: aStream)
]

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeCollectionReference: aCollectionReference
from: aStream [

	| size |
	size := self decodeControlWord: aStream.
	aCollectionReference intermediate: ((1 to: size) collect: [:i | self decodeReference: aStream])
]

{ #category : 'decoding-commands' }
RsrProtocolDecoder >> decodeCommand: aStream [
	"Decode an object from the stream"

	| command |
	command := self decodeControlWord: aStream.
	command == self sendMessageCommand ifTrue: [^self decodeSendMessage: aStream].
	command == self deliverResponseCommand ifTrue: [^self decodeDeliverResponse: aStream].
	command == self releaseObjectsCommand ifTrue: [^self decodeReleaseServices: aStream].
	^RsrError signal: 'Unknown command identifier: ', command printString
]

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeDateAndTimeReference: aDateAndTimeReference
from: aStream [

	aDateAndTimeReference intermediate: (self decodeControlWord: aStream)
]

{ #category : 'decoding-commands' }
RsrProtocolDecoder >> decodeDeliverResponse: aStream [

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

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeDictionaryReference: aDictionaryReference
from: aStream [

	| size |
	size := self decodeControlWord: aStream.
	aDictionaryReference intermediate: ((1 to: size * 2) collect: [:each | self decodeReference: aStream])
]

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeDoubleReference: aDoubleReference
from: aStream [

	aDoubleReference intermediate: (aStream next: 8)
]

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeFalseReference: aTrueReference
from: aStream [
	"No additional information to decode."
]

{ #category : 'decoding-services' }
RsrProtocolDecoder >> decodeImmediateReference: aStream [

	| referenceType |
	referenceType := self decodeControlWord: aStream.
	^(self instanceOfImmediate: referenceType)
		decode: aStream
		using: self
]

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeIntegerReference: anIntegerReference
from: aStream [

	| length |
	length := self decodeControlWord: aStream.
	anIntegerReference intermediate: (aStream next: length)
]

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeNilReference: aNilReference
from: aStream [
	"No additional information to decode."
]

{ #category : 'decoding' }
RsrProtocolDecoder >> decodeReference: aStream [

	| oid |
	oid := self decodeControlWord: aStream.
	oid = self immediateOID ifTrue: [^self decodeImmediateReference: aStream].
	^RsrServiceReference sid: oid
]

{ #category : 'decoding-commands' }
RsrProtocolDecoder >> decodeReleaseServices: aStream [

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
RsrProtocolDecoder >> decodeSendMessage: aStream [

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
RsrProtocolDecoder >> decodeServiceSnapshot: aStream [
	"This is different between protocol version."
	
	self subclassResponsibility
]

{ #category : 'decoding-references' }
RsrProtocolDecoder >> decodeTrueReference: aTrueReference
from: aStream [
	"No additional information to decode."
]

{ #category : 'decoding-services' }
RsrProtocolDecoder >> instanceOfImmediate: aReferenceType [

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
