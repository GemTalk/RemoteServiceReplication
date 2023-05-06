Class {
	#name : 'RsrInMemorySessionTestCase',
	#superclass : 'RsrSessionTestCase',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrInMemorySessionTestCase >> setUp [

	super setUp.
	self initializeInMemorySessions
]
