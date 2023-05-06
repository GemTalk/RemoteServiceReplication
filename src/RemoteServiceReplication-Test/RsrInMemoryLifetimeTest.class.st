Class {
	#name : 'RsrInMemoryLifetimeTest',
	#superclass : 'RsrLifetimeTest',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrInMemoryLifetimeTest >> setUp [

	super setUp.
	self initializeInMemorySessions
]
