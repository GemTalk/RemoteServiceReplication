"
No class-specific documentation for RsrDateAndTimeReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrDateAndTimeReference

"
Class {
	#name : 'RsrDateAndTimeReference',
	#superclass : 'RsrValueReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrDateAndTimeReference class >> from: aDateAndTime [

	| intermediate |
	intermediate := RsrDateAndTime microsecondsSinceEpoch: aDateAndTime.
	^self intermediate: intermediate
]

{ #category : 'accessing' }
RsrDateAndTimeReference class >> typeIdentifier [

	^14
]

{ #category : 'encoding/decoding' }
RsrDateAndTimeReference >> decode: aStream
using: aDecoder [

	intermediate := aDecoder decodeControlWord: aStream
]

{ #category : 'encoding/decoding' }
RsrDateAndTimeReference >> encode: aStream
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
RsrDateAndTimeReference >> resolve: anRsrSession [

	^RsrDateAndTime fromMicroseconds: intermediate
]
