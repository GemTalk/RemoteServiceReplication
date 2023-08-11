Class {
	#name : 'RsrObsoleteCodec',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication'
}

{ #category : 'converting' }
RsrObsoleteCodec >> bytesAsInteger: bytes [

	| res |
	res := 0.
	bytes do: [:e | res := (res bitShift: 8) bitOr: e].
	^res
]

{ #category : 'accessing' }
RsrObsoleteCodec >> controlWordMax [

	^(2 raisedTo: 63) - 1
]

{ #category : 'accessing' }
RsrObsoleteCodec >> controlWordMin [

	^(2 raisedTo: 63) negated
]

{ #category : 'decoding' }
RsrObsoleteCodec >> decodeControlWord: aStream [

	| bytes unsignedResult |
	bytes := aStream next: self sizeOfInteger.
	unsignedResult := self bytesAsInteger: bytes.
	^unsignedResult > self controlWordMax
		ifTrue: [(2 raisedTo: 64) negated + unsignedResult]
		ifFalse: [unsignedResult]
]

{ #category : 'encoding' }
RsrObsoleteCodec >> encodeControlWord: anInteger
onto: aStream [

	| encodedInteger encodedBytes |
	(anInteger between: self controlWordMin and: self controlWordMax)
		ifFalse: [self error: anInteger printString, ' is outside the supported size of a control word.'].
	encodedInteger := (anInteger positive
		ifTrue: [anInteger]
		ifFalse: [(2 raisedTo: 64) + anInteger]).
	encodedBytes := self
		integerAsByteArray: encodedInteger
		ofSize: self sizeOfInteger.
	aStream nextPutAll: encodedBytes
]

{ #category : 'converting' }
RsrObsoleteCodec >> integerAsByteArray: anInteger
ofSize: aNumberOfBytes [

	| bytes int |
	bytes := ByteArray new: aNumberOfBytes.
	int := anInteger.
	aNumberOfBytes
		to: 1
		by: -1
		do:
			[:i | | byte |
			byte := int bitAnd: 16rFF.
			int := int bitShift: -8.
			bytes at: i put: byte].
	int ~= 0
		ifTrue: [self error: 'Loss of precision detected'].
	^bytes
]

{ #category : 'accessing' }
RsrObsoleteCodec >> sizeOfInteger [
	"Return the number of bytes used to encode an integer"

	^8
]
