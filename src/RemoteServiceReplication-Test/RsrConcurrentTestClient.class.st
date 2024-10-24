Class {
	#name : 'RsrConcurrentTestClient',
	#superclass : 'RsrConcurrentTestService',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrConcurrentTestClient >> counterWithIncrement [

	^remoteSelf counterWithIncrement wait
]

{ #category : 'accessing' }
RsrConcurrentTestClient >> delayedCounter [

	^remoteSelf delayedCounter wait
]

{ #category : 'actions' }
RsrConcurrentTestClient >> stashProcess [

	remoteSelf stashProcess wait
]
