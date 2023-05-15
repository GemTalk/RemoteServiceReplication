Class {
	#name : 'RsrTokenExchange',
	#superclass : 'RsrHandshakeStep',
	#instVars : [
		'token'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrTokenExchange class >> token: aToken [

	^self new
		token: aToken;
		yourself
]

{ #category : 'accessing' }
RsrTokenExchange >> codec [

	^RsrGciTokenExchangeCodec new
]

{ #category : 'accessing' }
RsrTokenExchange >> token [

	^token
]

{ #category : 'accessing' }
RsrTokenExchange >> token: aToken [

	token := aToken
]
