Class {
	#name : 'RsrSocketServiceTestV2',
	#superclass : 'RsrSocketServiceTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrSocketServiceTestV2 >> setUp [

	super setUp.
	self initializeSocketConnectionsV2
]

{ #category : 'running' }
RsrSocketServiceTestV2 >> testSendClientWithoutAssociatedServer [
	"See RsrInMemoryServiceTest>>testSendClientWithoutAssociatedServer"

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [:x | x].
	reason := self expectCatch: (client asyncValue: RsrKnownClient new).
	self
		assert: reason class
		equals: RsrRemoteExceptionServer.
	self
		assert: reason exceptionClassName
		equals: #RsrUnknownClass
]
