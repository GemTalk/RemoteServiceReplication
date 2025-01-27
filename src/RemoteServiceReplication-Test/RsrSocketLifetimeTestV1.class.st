Class {
	#name : 'RsrSocketLifetimeTestV1',
	#superclass : 'RsrSocketLifetimeTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketLifetimeTestV1 >> setUp [

	super setUp.
	self initializeSocketConnectionsV1
]
