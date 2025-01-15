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

{ #category : 'encoding/decoding' }
RsrByteArrayReference >> decode: aStream
using: aDecoder [

	aDecoder
		decodeByteArrayReference: self
		from: aStream
]

{ #category : 'encoding/decoding' }
RsrByteArrayReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeByteArrayReference: self
		onto: aStream
]
