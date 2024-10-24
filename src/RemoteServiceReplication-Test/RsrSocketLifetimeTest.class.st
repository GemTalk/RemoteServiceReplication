Class {
	#name : 'RsrSocketLifetimeTest',
	#superclass : 'RsrLifetimeTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketLifetimeTest >> setUp [

	super setUp.
	self initializeSocketConnections
]
