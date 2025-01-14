"
No class-specific documentation for RsrTrueReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference( value)
        RsrTrueReference

"
Class {
	#name : 'RsrTrueReference',
	#superclass : 'RsrBooleanReference',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'encoding/decoding' }
RsrTrueReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeTrueReference: self
		onto: aStream
]

{ #category : 'resolving' }
RsrTrueReference >> resolve: aConnection [

	^true
]
