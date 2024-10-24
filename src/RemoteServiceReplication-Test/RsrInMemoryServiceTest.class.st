Class {
	#name : 'RsrInMemoryServiceTest',
	#superclass : 'RsrServiceTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrInMemoryServiceTest >> setUp [

	super setUp.
	self initializeInMemoryConnections
]
