Class {
	#name : 'RsrSocketStressTestV1',
	#superclass : 'RsrSocketStressTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'initializing' }
RsrSocketStressTestV1 >> initializeConnections [

	self initializeSocketConnectionsV1
]
