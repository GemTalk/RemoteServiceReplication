Class {
	#name : 'RsrSocketMessageSendingTestV1',
	#superclass : 'RsrSocketMessageSendingTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketMessageSendingTestV1 >> setUp [

	super setUp.
	self initializeSocketConnectionsV1
]
