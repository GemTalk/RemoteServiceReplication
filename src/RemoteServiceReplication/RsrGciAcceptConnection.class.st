Class {
	#name : 'RsrGciAcceptConnection',
	#superclass : 'RsrAcceptConnection',
	#instVars : [
		'token'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrGciAcceptConnection class >> host: hostnameOrAddress
port: port
token: aToken [

	^self new
		host: hostnameOrAddress;
		port: port;
		token: aToken;
		yourself
]

{ #category : 'accessing' }
RsrGciAcceptConnection >> handshakeSteps [
	"Returns a sequence of steps needed to perform a successful handshake."

	^Array
		with: RsrProtocolVersionNegotiationServer new
		with: (RsrTokenReceiver token: self token)
]

{ #category : 'initializing' }
RsrGciAcceptConnection >> initialize [

	super initialize.
	token := RsrToken newRandom
]

{ #category : 'accessing' }
RsrGciAcceptConnection >> token [
	"Returns the token used during handshake."

	^token
]

{ #category : 'accessing' }
RsrGciAcceptConnection >> token: aToken [
	"Stores the token used during handshake."

	token := aToken
]
