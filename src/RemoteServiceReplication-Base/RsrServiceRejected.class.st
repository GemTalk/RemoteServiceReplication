Class {
	#name : 'RsrServiceRejected',
	#superclass : 'RsrError',
	#instVars : [
		'reason'
	],
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'signaling' }
RsrServiceRejected class >> signalReason: aReason [

	^self new
		reason: aReason;
		signal
]

{ #category : 'accessing' }
RsrServiceRejected >> reason [
	"The PolicyRejectedService reason"

	^reason
]

{ #category : 'accessing' }
RsrServiceRejected >> reason: aPolicyRejectedService [
	"The PolicyRejectedService reason"

	reason := aPolicyRejectedService
]
