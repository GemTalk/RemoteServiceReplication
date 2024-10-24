Class {
	#name : 'RsrHandshakeStep',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'performing' }
RsrHandshakeStep >> performOver: aStream [
	"Perform the work for this step."

	^self subclassResponsibility
]
