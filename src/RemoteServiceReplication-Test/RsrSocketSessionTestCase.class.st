Class {
	#name : 'RsrSocketSessionTestCase',
	#superclass : 'RsrSessionTestCase',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketSessionTestCase >> setUp [

	super setUp.
	self initializeSocketConnections
]
