Class {
	#name : 'RsrInMemoryLifetimeTest',
	#superclass : 'RsrLifetimeTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrInMemoryLifetimeTest >> setUp [

	super setUp.
	self initializeInMemoryConnections
]
