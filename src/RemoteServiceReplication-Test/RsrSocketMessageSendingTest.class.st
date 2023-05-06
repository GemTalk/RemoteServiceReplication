Class {
	#name : 'RsrSocketMessageSendingTest',
	#superclass : 'RsrMessageSendingTest',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketMessageSendingTest >> setUp [

	super setUp.
	self initializeSocketSessions
]
