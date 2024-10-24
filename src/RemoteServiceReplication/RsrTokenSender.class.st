Class {
	#name : 'RsrTokenSender',
	#superclass : 'RsrTokenExchange',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'performing' }
RsrTokenSender >> performOver: aStream [
	"Send the token. Wait for confirmation."

	| confirmation |
	self codec
		encodeToken: self token
		onto: aStream.
	aStream flush.
	confirmation := self codec decode: aStream.
	confirmation wasAccepted
		ifFalse: [RsrTokenExchangeFailed signal: 'Token was rejected']
]
