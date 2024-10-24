Class {
	#name : 'RsrSocketStressTest',
	#superclass : 'RsrStressTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrSocketStressTest class >> defaultTimeLimit [
	"These tests take longer over a Socket"

	^60 seconds
]

{ #category : 'initializing' }
RsrSocketStressTest >> initializeConnections [

	self initializeSocketConnections
]
