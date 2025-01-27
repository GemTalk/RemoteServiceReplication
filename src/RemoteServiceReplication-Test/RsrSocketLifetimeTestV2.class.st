Class {
	#name : 'RsrSocketLifetimeTestV2',
	#superclass : 'RsrSocketLifetimeTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketLifetimeTestV2 >> setUp [

	super setUp.
	self initializeSocketConnectionsV2
]
