Class {
	#name : 'RsrRemoteActionServer',
	#superclass : 'RsrRemoteAction',
	#instVars : [
		'action',
		'debugHandler',
		'preUpdateHandler',
		'postUpdateHandler',
		'postRegistrationHandler'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrRemoteActionServer >> action [

	^action
]

{ #category : 'accessing' }
RsrRemoteActionServer >> action: aBlock [

	action := aBlock
]

{ #category : 'debugging' }
RsrRemoteActionServer >> debug: anException
raisedDuring: aMessageSend
answerUsing: aResolver [

	^self debugHandler
		value: anException
		value: aMessageSend
		value: aResolver
]

{ #category : 'accessing' }
RsrRemoteActionServer >> debugHandler [

	^debugHandler ifNil: [[:x :y :z | nil]]
]

{ #category : 'accessing' }
RsrRemoteActionServer >> debugHandler: aBlock [

	debugHandler := aBlock
]

{ #category : 'evaluating' }
RsrRemoteActionServer >> evaluateAction [

	^self action value
]

{ #category : 'evaluating' }
RsrRemoteActionServer >> evaluateAction: anObject [

	^self action value: anObject
]

{ #category : 'processing' }
RsrRemoteActionServer >> postRegistration [

	self postRegistrationHandler value
]

{ #category : 'accessing' }
RsrRemoteActionServer >> postRegistrationHandler [

	^postRegistrationHandler ifNil: [[]]
]

{ #category : 'accessing' }
RsrRemoteActionServer >> postRegistrationHandler: aBlock [

	postRegistrationHandler := aBlock
]

{ #category : 'processing' }
RsrRemoteActionServer >> postUpdate [

	self postUpdateHandler value
]

{ #category : 'accessing' }
RsrRemoteActionServer >> postUpdateHandler [

	^postUpdateHandler ifNil: [[]]
]

{ #category : 'accessing' }
RsrRemoteActionServer >> postUpdateHandler: aBlock [

	postUpdateHandler := aBlock
]

{ #category : 'processing' }
RsrRemoteActionServer >> preUpdate [

	self preUpdateHandler value
]

{ #category : 'accessing' }
RsrRemoteActionServer >> preUpdateHandler [

	^preUpdateHandler ifNil: [[]]
]

{ #category : 'accessing' }
RsrRemoteActionServer >> preUpdateHandler: aBlock [

	preUpdateHandler := aBlock
]
