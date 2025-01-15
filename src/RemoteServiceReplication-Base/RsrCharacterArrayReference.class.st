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
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
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

	aDecoder
		decodeCharacterArrayReference: self
		from: aStream
]

{ #category : 'resolving' }
RsrCharacterArrayReference >> resolve: aConnection [

	^self convertBytes: intermediate
]
