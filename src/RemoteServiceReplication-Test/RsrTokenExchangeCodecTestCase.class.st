Class {
	#name : 'RsrTokenExchangeCodecTestCase',
	#superclass : 'RsrTestCase',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrTokenExchangeCodecTestCase >> codec [

	^RsrGciTokenExchangeCodec new
]

{ #category : 'utilities' }
RsrTokenExchangeCodecTestCase >> stream: aBlock [

	^ByteArray streamContents: aBlock
]

{ #category : 'running' }
RsrTokenExchangeCodecTestCase >> testToken [

	| tokenBytes expected token result |
	tokenBytes := #[16r58 16r18 16rE8 16rA2 16rB6 16rA6 16r91 16r39 16rD2 16rA6 16rC1 16r13 16r15 16r65 16r0F 16r6A].
	expected := 
		#[0 0 0 0 0 0 0 0], "Type"
		#[0 0 0 0 0 0 0 16], "token byte length"
		tokenBytes.
	token := RsrToken bytes: tokenBytes.
	result := self stream: [:stream | self codec encodeToken: token onto: stream].
	self
		assert: result
		equals: expected.
	result := self codec decode: expected readStream.
	self
		assert: result
		equals: token
]

{ #category : 'running' }
RsrTokenExchangeCodecTestCase >> testTokenAccepted [

	| expected tokenAccepted result |
	expected := #[0 0 0 0 0 0 0 1]. "Type"
	tokenAccepted := RsrTokenAccepted new.
	result := self stream: [:stream | self codec encodeTokenAccepted: tokenAccepted onto: stream].
	self
		assert: result
		equals: expected.
	result := self codec decode: expected readStream.
	self
		assert: result
		equals: tokenAccepted
]

{ #category : 'running' }
RsrTokenExchangeCodecTestCase >> testTokenRejected [

	| expected tokenRejected result |
	expected := #[0 0 0 0 0 0 0 2]. "Type"
	tokenRejected := RsrTokenRejected new.
	result := self stream: [:stream | self codec encodeTokenRejected: tokenRejected onto: stream].
	self
		assert: result
		equals: expected.
	result := self codec decode: expected readStream.
	self
		assert: result
		equals: tokenRejected
]
