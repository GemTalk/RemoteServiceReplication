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

	aReferenceType = 1
		ifTrue: [^RsrSymbolReference new].
	aReferenceType = 2
		ifTrue: [^RsrStringReference new].
	aReferenceType = 3
		ifTrue: [^RsrPositiveIntegerReference new].
	aReferenceType = 4
		ifTrue: [^RsrNegativeIntegerReference new].
	aReferenceType = 5
		ifTrue: [^RsrCharacterReference new].
	aReferenceType = 6
		ifTrue: [^RsrNilReference new].
	aReferenceType = 7
		ifTrue: [^RsrTrueReference new].
	aReferenceType = 8
		ifTrue: [^RsrFalseReference new].
	aReferenceType = 9
		ifTrue: [^RsrArrayReference new].
	aReferenceType = 10
		ifTrue: [^RsrByteArrayReference new].
	aReferenceType = 11
		ifTrue: [^RsrSetReference new].
	aReferenceType = 12
		ifTrue: [^RsrOrderedCollectionReference new].
	aReferenceType = 13
		ifTrue: [^RsrDictionaryReference new].
	aReferenceType = 14
		ifTrue: [^RsrDateAndTimeReference new].
	aReferenceType = 15
		ifTrue: [^RsrDoubleReference new].
	self error: 'ReferenceType(', aReferenceType printString, ') not yet implemented'.
]
