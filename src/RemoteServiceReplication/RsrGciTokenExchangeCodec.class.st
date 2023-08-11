Class {
	#name : 'RsrGciTokenExchangeCodec',
	#superclass : 'RsrObsoleteCodec',
	#category : 'RemoteServiceReplication'
}

{ #category : 'decoding' }
RsrGciTokenExchangeCodec >> decode: aStream [

	| identifier |
	identifier := self decodeControlWord: aStream.
	identifier = self tokenIdentifier
		ifTrue: [^self decodeToken: aStream].
	identifier = self tokenAcceptedIdentifier
		ifTrue: [^RsrTokenAccepted new].
	identifier = self tokenRejectedIdentifier
		ifTrue: [^RsrTokenRejected new].
	^RsrTokenExchangeFailed signal: 'Unknown identifier: ', identifier printString
]

{ #category : 'decoding' }
RsrGciTokenExchangeCodec >> decodeToken: aStream [

	| size |
	size := self decodeControlWord: aStream.
	^RsrToken bytes: (aStream next: size)
]

{ #category : 'encoding' }
RsrGciTokenExchangeCodec >> encodeToken: aToken
onto: aStream [

	self
		encodeControlWord: self tokenIdentifier
		onto: aStream.
	self
		encodeControlWord: aToken bytes size
		onto: aStream.
	aStream nextPutAll: aToken bytes
]

{ #category : 'encoding' }
RsrGciTokenExchangeCodec >> encodeTokenAccepted: aTokenAccepted
onto: aStream [

	self
		encodeControlWord: self tokenAcceptedIdentifier
		onto: aStream
]

{ #category : 'encoding' }
RsrGciTokenExchangeCodec >> encodeTokenRejected: aTokenRejected
onto: aStream [

	self
		encodeControlWord: self tokenRejectedIdentifier
		onto: aStream
]

{ #category : 'accessing' }
RsrGciTokenExchangeCodec >> tokenAcceptedIdentifier [

	^1
]

{ #category : 'accessing' }
RsrGciTokenExchangeCodec >> tokenIdentifier [

	^0
]

{ #category : 'accessing' }
RsrGciTokenExchangeCodec >> tokenRejectedIdentifier [

	^2
]
