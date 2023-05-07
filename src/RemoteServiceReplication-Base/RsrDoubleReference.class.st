Class {
	#name : 'RsrDoubleReference',
	#superclass : 'RsrValueReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrDoubleReference class >> from: aFloat [

	| intermediate |
	intermediate := self convertToBytes: aFloat.
	^self intermediate: intermediate
]

{ #category : 'accessing' }
RsrDoubleReference class >> typeIdentifier [

	^15
]

{ #category : 'encoding/decoding' }
RsrDoubleReference >> decode: aStream
using: aDecoder [

	intermediate := aStream next: 8
]

{ #category : 'encoding/decoding' }
RsrDoubleReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	aStream nextPutAll: intermediate
]

{ #category : 'resolving' }
RsrDoubleReference >> resolve: anRsrSession [

	^self convertBytes: intermediate
]
