Class {
	#name : 'RsrRemoteActionClient',
	#superclass : 'RsrRemoteAction',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'evaluating' }
RsrRemoteActionClient >> asyncValue [

	^remoteSelf evaluateAction
]

{ #category : 'evaluating' }
RsrRemoteActionClient >> asyncValue: anObject [

	^remoteSelf evaluateAction: anObject
]

{ #category : 'evaluating' }
RsrRemoteActionClient >> value [

	^self asyncValue wait
]

{ #category : 'evaluating' }
RsrRemoteActionClient >> value: anObject [

	^(self asyncValue: anObject) wait
]
