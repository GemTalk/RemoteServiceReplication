Class {
	#name : 'RsrInMemoryStressTest',
	#superclass : 'RsrStressTest',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'initialize/release' }
RsrInMemoryStressTest >> initializeSessions [

	self initializeInMemorySessions
]
