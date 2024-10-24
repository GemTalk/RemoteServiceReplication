Class {
	#name : 'RsrInMemorySpeciesEquality',
	#superclass : 'RsrSpeciesEquality',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrInMemorySpeciesEquality >> setUp [

	super setUp.
	self initializeInMemoryConnections
]
