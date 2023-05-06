Class {
	#name : 'RsrSocketSpeciesEquality',
	#superclass : 'RsrSpeciesEquality',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketSpeciesEquality >> setUp [

	super setUp.
	self initializeSocketSessions
]
