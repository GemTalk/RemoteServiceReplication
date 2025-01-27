Class {
	#name : 'RsrSocketSpeciesEqualityV2',
	#superclass : 'RsrSocketSpeciesEquality',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketSpeciesEqualityV2 >> setUp [

	super setUp.
	self initializeSocketConnectionsV2
]
