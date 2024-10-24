Extension { #name : 'RsrCharacterArrayReference' }

{ #category : '*RemoteServiceReplication-Pharo-12' }
RsrCharacterArrayReference >> convertBytes: aByteArray [

	^aByteArray utf8Decoded
]

{ #category : '*RemoteServiceReplication-Pharo-12' }
RsrCharacterArrayReference class >> convertToBytes: aCharacterArray [

	^aCharacterArray utf8Encoded

]
