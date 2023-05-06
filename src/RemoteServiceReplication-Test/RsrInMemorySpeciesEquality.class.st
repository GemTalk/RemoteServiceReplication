Class {
	#name : 'RsrInMemorySpeciesEquality',
	#superclass : 'RsrSpeciesEquality',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrInMemorySpeciesEquality >> setUp [

	super setUp.
	self initializeInMemorySessions
]
