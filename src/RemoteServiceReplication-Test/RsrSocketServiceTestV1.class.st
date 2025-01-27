Class {
	#name : 'RsrSocketServiceTestV1',
	#superclass : 'RsrSocketServiceTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketServiceTestV1 >> setUp [

	super setUp.
	self initializeSocketConnectionsV1
]
