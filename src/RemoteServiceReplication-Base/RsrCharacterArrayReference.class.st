"
No class-specific documentation for RsrCharacterArrayReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrCharacterArrayReference

"
Class {
	#name : 'RsrCharacterArrayReference',
	#superclass : 'RsrValueReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrCharacterArrayReference class >> from: aCharacterArray [

	| bytes |
	bytes := self convertToBytes: aCharacterArray.
	^self intermediate: bytes
]

{ #category : 'encoding/decoding' }
RsrCharacterArrayReference >> decode: aStream
using: aDecoder [

	| length |
	length := aDecoder decodeControlWord: aStream.
	intermediate := aStream next: length
]

{ #category : 'encoding/decoding' }
RsrCharacterArrayReference >> encode: aStream
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
RsrCharacterArrayReference >> resolve: anRsrSession [

	^self convertBytes: intermediate
]
