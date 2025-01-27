Class {
	#name : 'RsrSocketMessageSendingTestV2',
	#superclass : 'RsrSocketMessageSendingTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketMessageSendingTestV2 >> setUp [

	super setUp.
	self initializeSocketConnectionsV2
]
