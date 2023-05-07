"
No class-specific documentation for RsrNilReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrNilReference

"
Class {
	#name : 'RsrNilReference',
	#superclass : 'RsrImmediateReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrNilReference class >> from: aNil [

	^self new
]

{ #category : 'accessing' }
RsrNilReference class >> typeIdentifier [

	^6
]

{ #category : 'encoding/decoding' }
RsrNilReference >> decode: aStream
using: aDecoder [

	"Nil has no additional value"
]

{ #category : 'encoding/decoding' }
RsrNilReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream
]

{ #category : 'resolving' }
RsrNilReference >> resolve: anRsrSession [

	^nil
]
