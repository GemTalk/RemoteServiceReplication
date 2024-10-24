Class {
	#name : 'RsrTokenExchange',
	#superclass : 'RsrHandshakeStep',
	#instVars : [
		'token'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrTokenExchange class >> token: aToken [

	^self new
		token: aToken;
		yourself
]

{ #category : 'accessing' }
RsrTokenExchange >> codec [

	^RsrTokenExchangeCodec new
]

{ #category : 'accessing' }
RsrTokenExchange >> token [

	^token
]

{ #category : 'accessing' }
RsrTokenExchange >> token: aToken [

	token := aToken
]
