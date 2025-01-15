"
No class-specific documentation for RsrFalseReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrFalseReference

"
Class {
	#name : 'RsrFalseReference',
	#superclass : 'RsrBooleanReference',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'encoding/decoding' }
RsrFalseReference >> decode: aStream
using: aDecoder [

	aDecoder
		decodeFalseReference: self
		from: aStream
]

{ #category : 'encoding/decoding' }
RsrFalseReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeFalseReference: self
		onto: aStream
]

{ #category : 'resolving' }
RsrFalseReference >> resolve: aConnection [

	^false
]
