Class {
	#name : 'RsrInMemoryMessageSendingTest',
	#superclass : 'RsrMessageSendingTest',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrInMemoryMessageSendingTest >> setUp [

	super setUp.
	self initializeInMemorySessions
]
