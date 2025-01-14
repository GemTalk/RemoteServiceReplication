"
No class-specific documentation for RsrArrayReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrArrayReference

"
Class {
	#name : 'RsrArrayReference',
	#superclass : 'RsrCollectionReference',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'accessing' }
RsrArrayReference class >> typeIdentifier [

	^9
]

{ #category : 'encoding/decoding' }
RsrArrayReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeArrayReference: self
		onto: aStream
]

{ #category : 'resolving' }
RsrArrayReference >> resolve: aConnection [

	^intermediate collect: [:each | each resolve: aConnection]
]
