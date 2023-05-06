Class {
	#name : 'RsrSocketLifetimeTest',
	#superclass : 'RsrLifetimeTest',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketLifetimeTest >> setUp [

	super setUp.
	self initializeSocketSessions
]
