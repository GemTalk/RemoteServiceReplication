Class {
	#name : 'RsrInMemoryConnectionTestCase',
	#superclass : 'RsrConnectionTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrInMemoryConnectionTestCase >> setUp [

	super setUp.
	self initializeInMemoryConnections
]
