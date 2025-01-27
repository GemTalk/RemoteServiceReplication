Class {
	#name : 'RsrSocketConnectionTestCaseV2',
	#superclass : 'RsrSocketConnectionTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketConnectionTestCaseV2 >> setUp [

	super setUp.
	self initializeSocketConnectionsV2
]
