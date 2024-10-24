Class {
	#name : 'RsrTokenReceiver',
	#superclass : 'RsrTokenExchange',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'performing' }
RsrTokenReceiver >> performOver: aStream [
	"Send the token. Wait for confirmation."

	| receivedToken |
	receivedToken := self codec decode: aStream.
	receivedToken = self token
		ifTrue:
			[self codec
				encodeTokenAccepted: nil "RsrTokenAccepted new"
				onto: aStream.
			aStream flush]
		ifFalse:
			[self codec
				encodeTokenRejected: nil "RsrTokenRejected new"
				onto: aStream.
			aStream flush.
			RsrTokenExchangeFailed signal]
]
