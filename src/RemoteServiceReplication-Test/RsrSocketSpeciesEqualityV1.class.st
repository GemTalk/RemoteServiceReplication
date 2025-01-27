Class {
	#name : 'RsrSocketSpeciesEqualityV1',
	#superclass : 'RsrSocketSpeciesEquality',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketSpeciesEqualityV1 >> setUp [

	super setUp.
	self initializeSocketConnectionsV1
]
