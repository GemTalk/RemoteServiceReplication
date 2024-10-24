Extension { #name : 'RsrDoubleReference' }

{ #category : '*RemoteServiceReplication-Pharo-12' }
RsrDoubleReference >> convertBytes: bytes [

	^bytes
		doubleAt: 1
		bigEndian: true
]

{ #category : '*RemoteServiceReplication-Pharo-12' }
RsrDoubleReference class >> convertToBytes: aFloat [

	| bytes |
	bytes := ByteArray new: 8.
	bytes
		doubleAt: 1
		put: aFloat
		bigEndian: true.
	^bytes
]

{ #category : '*RemoteServiceReplication-Pharo-12' }
RsrDoubleReference class >> infinity [

	^Float infinity
]

{ #category : '*RemoteServiceReplication-Pharo-12' }
RsrDoubleReference class >> nan [

	^Float nan
]
