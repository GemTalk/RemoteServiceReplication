"
No class-specific documentation for RsrCharacterReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrCharacterReference

"
Class {
	#name : 'RsrCharacterReference',
	#superclass : 'RsrValueReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrCharacterReference class >> from: aCharacter [

	^self intermediate: aCharacter codePoint
]

{ #category : 'accessing' }
RsrCharacterReference class >> typeIdentifier [

	^5
]

{ #category : 'encoding/decoding' }
RsrCharacterReference >> decode: aStream
using: aDecoder [

	intermediate := aDecoder decodeControlWord: aStream
]

{ #category : 'encoding/decoding' }
RsrCharacterReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate
		onto: aStream
]

{ #category : 'resolving' }
RsrCharacterReference >> resolve: anRsrSession [

	^Character codePoint: intermediate
]
