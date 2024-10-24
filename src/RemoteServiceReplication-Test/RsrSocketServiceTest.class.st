Class {
	#name : 'RsrSocketServiceTest',
	#superclass : 'RsrServiceTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketServiceTest >> setUp [

	super setUp.
	self initializeSocketConnections
]
