Class {
	#name : 'RsrInMemoryServiceTest',
	#superclass : 'RsrServiceTest',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrInMemoryServiceTest >> setUp [

	super setUp.
	self initializeInMemorySessions
]
