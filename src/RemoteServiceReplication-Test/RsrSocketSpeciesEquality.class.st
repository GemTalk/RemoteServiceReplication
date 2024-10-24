Class {
	#name : 'RsrSocketSpeciesEquality',
	#superclass : 'RsrSpeciesEquality',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketSpeciesEquality >> setUp [

	super setUp.
	self initializeSocketConnections
]
