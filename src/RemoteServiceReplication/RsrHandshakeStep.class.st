Class {
	#name : 'RsrHandshakeStep',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'performing' }
RsrHandshakeStep >> performFor: aHandshake
over: aStream [
	"Perform the work for this step."

	^self performOver: aStream
]

{ #category : 'performing' }
RsrHandshakeStep >> performOver: aStream [
	"By default, this method is called from
	#performFor:over: for backwards-compatibility
	reasons.
	
	#performFor:over: is the prefered method and
	should be used for new steps."

	"NOP by default"
]
