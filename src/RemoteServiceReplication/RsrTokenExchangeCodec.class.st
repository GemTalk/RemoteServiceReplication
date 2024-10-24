Class {
	#name : 'RsrTokenExchangeCodec',
	#superclass : 'RsrCodec',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'decoding' }
RsrTokenExchangeCodec >> decode: aStream [

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
RsrTokenExchangeCodec >> decodeToken: aStream [

	| size |
	size := self decodeControlWord: aStream.
	^RsrToken bytes: (aStream next: size)
]

{ #category : 'encoding' }
RsrTokenExchangeCodec >> encodeToken: aToken
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
RsrTokenExchangeCodec >> encodeTokenAccepted: aTokenAccepted
onto: aStream [

	self
		encodeControlWord: self tokenAcceptedIdentifier
		onto: aStream
]

{ #category : 'encoding' }
RsrTokenExchangeCodec >> encodeTokenRejected: aTokenRejected
onto: aStream [

	self
		encodeControlWord: self tokenRejectedIdentifier
		onto: aStream
]

{ #category : 'accessing' }
RsrTokenExchangeCodec >> tokenAcceptedIdentifier [

	^1
]

{ #category : 'accessing' }
RsrTokenExchangeCodec >> tokenIdentifier [

	^0
]

{ #category : 'accessing' }
RsrTokenExchangeCodec >> tokenRejectedIdentifier [

	^2
]
