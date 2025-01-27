Class {
	#name : 'RsrSocketConnectionTestCaseV1',
	#superclass : 'RsrSocketConnectionTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketConnectionTestCaseV1 >> setUp [

	super setUp.
	self initializeSocketConnectionsV1
]
