Class {
	#name : 'RsrSocketServiceTest',
	#superclass : 'RsrServiceTest',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketServiceTest >> setUp [

	super setUp.
	self initializeSocketSessions
]
