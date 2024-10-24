Class {
	#name : 'RsrSocketConnectionTestCase',
	#superclass : 'RsrConnectionTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketConnectionTestCase >> setUp [

	super setUp.
	self initializeSocketConnections
]
