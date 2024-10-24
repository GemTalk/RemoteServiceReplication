Class {
	#name : 'RsrInMemoryMessageSendingTest',
	#superclass : 'RsrMessageSendingTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrInMemoryMessageSendingTest >> setUp [

	super setUp.
	self initializeInMemoryConnections
]
