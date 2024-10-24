Class {
	#name : 'RsrSocketMessageSendingTest',
	#superclass : 'RsrMessageSendingTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketMessageSendingTest >> setUp [

	super setUp.
	self initializeSocketConnections
]
