"
No class-specific documentation for RsrByteArrayReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrByteArrayReference

"
Class {
	#name : 'RsrByteArrayReference',
	#superclass : 'RsrValueReference',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrByteArrayReference class >> from: aByteArray [

	^self intermediate: aByteArray copy
]

{ #category : 'accessing' }
RsrByteArrayReference class >> typeIdentifier [

	^10
]

{ #category : 'encoding/decoding' }
RsrByteArrayReference >> decode: aStream
using: aDecoder [

	| length |
	length := aDecoder decodeControlWord: aStream.
	intermediate := aStream next: length
]

{ #category : 'encoding/decoding' }
RsrByteArrayReference >> encode: aStream
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
