Class {
	#name : 'RsrRemoteActionServer',
	#superclass : 'RsrRemoteAction',
	#instVars : [
		'action'
	],
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrRemoteActionServer >> action [

	^action
]

{ #category : 'accessing' }
RsrRemoteActionServer >> action: aBlock [

	action := aBlock
]

{ #category : 'evaluating' }
RsrRemoteActionServer >> value [

	^self action value
]

{ #category : 'evaluating' }
RsrRemoteActionServer >> value: anObject [

	^self action value: anObject
]

{ #category : 'evaluating' }
RsrRemoteActionServer >> valueWithArguments: anArray [

	^self action valueWithArguments: anArray
]