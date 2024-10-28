Class {
	#name : 'RsrBrokenPromise',
	#superclass : 'RsrPromiseError',
	#instVars : [
		'reason'
	],
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'signaling' }
RsrBrokenPromise class >> signalReason: aReason [

	^self new
		reason: aReason;
		signal
]

{ #category : 'accessing' }
RsrBrokenPromise >> reason [

	^reason
]

{ #category : 'accessing' }
RsrBrokenPromise >> reason: aReason [

	reason := aReason
]
