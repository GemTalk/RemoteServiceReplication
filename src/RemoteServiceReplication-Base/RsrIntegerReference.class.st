"
No class-specific documentation for RsrIntegerReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrIntegerReference( value)

"
Class {
	#name : 'RsrIntegerReference',
	#superclass : 'RsrValueReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'converting' }
RsrIntegerReference class >> convertToBytes: anInteger [

	| stream int |
	anInteger <= 0
		ifTrue: [^#[0]].
	stream := WriteStream on: (ByteArray new: 8).
	int := anInteger.
	[int > 0]
		whileTrue:
			[stream nextPut: (int bitAnd: 16rFF).
			int := int bitShift: -8].
	^stream contents reverse
]

{ #category : 'instance creation' }
RsrIntegerReference class >> from: anInteger [

	| intermediate |
	intermediate := self convertToBytes: anInteger abs.
	^anInteger positive
		ifTrue: [RsrPositiveIntegerReference intermediate: intermediate]
		ifFalse: [RsrNegativeIntegerReference intermediate: intermediate]
]

{ #category : 'converting' }
RsrIntegerReference >> convertBytes: aByteArray [

	^aByteArray
		inject: 0
		into: [:integer :byte | (integer bitShift: 8) bitOr: byte]
]

{ #category : 'encoding/decoding' }
RsrIntegerReference >> decode: aStream
using: aDecoder [

	| length |
	length := aDecoder decodeControlWord: aStream.
	intermediate := aStream next: length
]

{ #category : 'encoding/decoding' }
RsrIntegerReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate size
		onto: aStream.
	aStream nextPutAll: intermediate
]

{ #category : 'resolving' }
RsrIntegerReference >> resolve: anRsrSession [

	^self convertBytes: intermediate
]
