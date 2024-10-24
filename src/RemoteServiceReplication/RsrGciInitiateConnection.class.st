Class {
	#name : 'RsrGciInitiateConnection',
	#superclass : 'RsrInitiateConnection',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrGciInitiateConnection class >> host: hostnameOrAddress
port: port
token: aToken [

	^self new
		host: hostnameOrAddress;
		port: port;
		token: aToken;
		yourself
]

{ #category : 'accessing' }
RsrGciInitiateConnection >> handshakeSteps [
	"Returns a sequence of steps needed to perform a successful handshake."

	^Array
		with: RsrProtocolVersionNegotiationClient new
		with: (RsrTokenSender token: self token)
]

{ #category : 'accessing' }
RsrGciInitiateConnection >> token [
	"Returns the token used during handshake."

	^token
]

{ #category : 'accessing' }
RsrGciInitiateConnection >> token: aToken [
	"Stores the token used during handshake."

	token := aToken
]
