Extension { #name : 'RsrCharacterArrayReference' }

{ #category : '*RemoteServiceReplication-Pharo-11' }
RsrCharacterArrayReference >> convertBytes: aByteArray [

	^aByteArray utf8Decoded
]

{ #category : '*RemoteServiceReplication-Pharo-11' }
RsrCharacterArrayReference class >> convertToBytes: aCharacterArray [

	^aCharacterArray utf8Encoded

]
