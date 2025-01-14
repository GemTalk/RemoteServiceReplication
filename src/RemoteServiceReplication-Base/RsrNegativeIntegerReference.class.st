"
No class-specific documentation for RsrNegativeIntegerReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrIntegerReference( value)
          RsrNegativeIntegerReference

"
Class {
	#name : 'RsrNegativeIntegerReference',
	#superclass : 'RsrIntegerReference',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'accessing' }
RsrNegativeIntegerReference class >> typeIdentifier [

	^4
]

{ #category : 'converting' }
RsrNegativeIntegerReference >> convertBytes: aByteArray [

	^(super convertBytes: aByteArray) negated
]

{ #category : 'encoding/decoding' }
RsrNegativeIntegerReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeNegativeIntegerReference: self
		onto: aStream
]
