Class {
	#name : 'RsrSocketStressTestV2',
	#superclass : 'RsrSocketStressTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'initializing' }
RsrSocketStressTestV2 >> initializeConnections [

	self initializeSocketConnectionsV2
]
