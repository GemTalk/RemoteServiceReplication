Class {
	#name : 'RsrConnectionSpecificationTestCase',
	#superclass : 'RsrTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrConnectionSpecificationTestCase >> alternativeLocalhost [

	^'127.0.1.1'
]

{ #category : 'accessing' }
RsrConnectionSpecificationTestCase >> localhost [

	^'127.0.0.1'
]

{ #category : 'accessing' }
RsrConnectionSpecificationTestCase >> port [

	^47652
]

{ #category : 'running' }
RsrConnectionSpecificationTestCase >> testAcceptOnLocalhost [

	| acceptor initiator semaphore connectionA connectionB |
	acceptor := RsrAcceptConnection host: self localhost port: self port.
	acceptor ensureListening.
	self assert: acceptor listeningPort equals: self port.
	initiator := RsrInitiateConnection
		             host: self localhost
		             port: self port.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [ 
			[ connectionA := acceptor waitForConnection ] ensure: [ 
					semaphore signal ] ]
		named: 'Pending AcceptConnection';
		fork: [ 
			[ connectionB := initiator connect ] ensure: [ semaphore signal ] ]
		named: 'Pending InitiateConnection'.
	semaphore
		wait;
		wait.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen.
	connectionA close.
	connectionB close
]

{ #category : 'running' }
RsrConnectionSpecificationTestCase >> testBindToAvailablePortRange [

	"If no one is listening on self port, we should get that port."

	| acceptor initiator semaphore connectionA connectionB |
	acceptor := RsrAcceptConnection
		            host: self localhost
		            portRange: (self port to: self port + 1).
	acceptor ensureListening.
	self assert: acceptor listeningPort equals: self port.
	initiator := RsrInitiateConnection
		             host: self localhost
		             port: acceptor listeningPort.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [ 
			[ connectionA := acceptor waitForConnection ] ensure: [ 
					semaphore signal ] ]
		named: 'Pending AcceptConnection';
		fork: [ 
			[ connectionB := initiator connect ] ensure: [ semaphore signal ] ]
		named: 'Pending InitiateConnection'.
	semaphore
		wait;
		wait.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen.
	connectionA close.
	connectionB close
]

{ #category : 'running' }
RsrConnectionSpecificationTestCase >> testBindToPartlyAvailablePortRange [

	"Listen on first port to force range to listen on second port."

	| blocker acceptor initiator semaphore connectionA connectionB |
	blocker := RsrAcceptConnection host: self localhost port: self port.
	[ 
	blocker ensureListening.
	self assert: blocker listeningPort equals: self port.
	acceptor := RsrAcceptConnection
		            host: self localhost
		            portRange: (self port to: self port + 1).
	acceptor ensureListening.
	self assert: acceptor listeningPort equals: self port + 1.
	initiator := RsrInitiateConnection
		             host: self localhost
		             port: acceptor listeningPort.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [ 
			[ connectionA := acceptor waitForConnection ] ensure: [ 
					semaphore signal ] ]
		named: 'Pending AcceptConnection';
		fork: [ 
			[ connectionB := initiator connect ] ensure: [ semaphore signal ] ]
		named: 'Pending InitiateConnection'.
	semaphore
		wait;
		wait.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen.
	connectionA close.
	connectionB close ] ensure: [ blocker cancelWaitForConnection ]
]

{ #category : 'running' }
RsrConnectionSpecificationTestCase >> testBindToUnavailablePortRange [

	"Listen on both ports in range -- range should then fail."

	| blocker1 blocker2 acceptor |
	blocker1 := RsrAcceptConnection host: self localhost port: self port.
	blocker2 := RsrAcceptConnection
		            host: self localhost
		            port: self port + 1.
	[ 
	blocker1 ensureListening.
	self assert: blocker1 listeningPort equals: self port.
	blocker2 ensureListening.
	self assert: blocker2 listeningPort equals: self port + 1.
	acceptor := RsrAcceptConnection
		            host: self localhost
		            portRange: (self port to: self port + 1).
	self should: [ acceptor ensureListening ] raise: RsrInvalidBind ] 
		ensure: [ 
			{ 
				blocker1.
				blocker2 } do: [ :each | each cancelWaitForConnection ] ]
]

{ #category : 'running' }
RsrConnectionSpecificationTestCase >> testBindToWildcardPort [

	| acceptor initiator semaphore connectionA connectionB |
	acceptor := RsrAcceptConnection
		host: self localhost
		port: RsrAcceptConnection wildcardPort.
	acceptor ensureListening.
	self assert: acceptor listeningPort > 0.
	initiator := RsrInitiateConnection
		host: self localhost
		port: acceptor listeningPort.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [[connectionA := acceptor waitForConnection] ensure: [semaphore signal]] named: 'Pending AcceptConnection';
		fork: [[connectionB := initiator connect] ensure: [semaphore signal]] named: 'Pending InitiateConnection'.
	semaphore wait; wait.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen.
	connectionA close.
	connectionB close
]

{ #category : 'running' }
RsrConnectionSpecificationTestCase >> testCancelWaitForConnection [

	| acceptor |
	acceptor := RsrAcceptConnection port: self port.
	RsrProcessModel
		fork: [(Delay forSeconds: 1) wait. acceptor cancelWaitForConnection]
		named: 'Canceling AcceptConnection'.
	self
		should: [acceptor waitForConnection]
		raise: RsrWaitForConnectionCancelled
]

{ #category : 'running' }
RsrConnectionSpecificationTestCase >> testEstablishConnection [

	| acceptor initiator semaphore connectionA connectionB |
	acceptor := RsrAcceptConnection port: self port.
	initiator := RsrInitiateConnection
		host: self localhost
		port: self port.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [[connectionA := acceptor waitForConnection] ensure: [semaphore signal]] named: 'Pending AcceptConnection';
		fork: [[connectionB := initiator connect] ensure: [semaphore signal]] named: 'Pending InitiateConnection'.
	semaphore wait; wait.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen.
	connectionA close.
	connectionB close
]

{ #category : 'running' }
RsrConnectionSpecificationTestCase >> testFailedAcceptOnAlternativeLocalhost [

	| acceptor initiator semaphore |
	acceptor := RsrAcceptConnection
		host: self alternativeLocalhost
		port: self port.
	initiator := RsrInitiateConnection
		host: self localhost
		port: self port.
	semaphore := Semaphore new.
	RsrProcessModel
		fork: [[semaphore signal. acceptor waitForConnection] on: RsrWaitForConnectionCancelled do: [:ex | ex return]]
		named: 'Pending WaitForConnectionCancelled'.
	[semaphore wait.
	self
		should: [initiator connect]
		raise: RsrSocketError]
			ensure: [acceptor cancelWaitForConnection]
]

{ #category : 'running' }
RsrConnectionSpecificationTestCase >> testInternalConnectionSpecificationConnectReturnsConnection [
	"Ensure that sending #connect to an InternalConnectionSpecification
	results in returning one of the created Connections."

	| spec connection |
	spec := RsrInMemoryConnectionSpecification new.
	connection := spec connect.
	self assert: connection isOpen.
	connection close.
	spec := RsrInternalSocketConnectionSpecification new.
	connection := spec connect.
	self assert: connection isOpen.
	connection close
]

{ #category : 'running' }
RsrConnectionSpecificationTestCase >> testListenThenLaterAccept [

	| acceptor initiator semaphore connectionA connectionB |
	acceptor := RsrAcceptConnection
		host: self localhost 
		port: self port.
	initiator := RsrInitiateConnection
		host: self localhost
		port: self port.
	semaphore := Semaphore new.
	acceptor ensureListening.
	RsrProcessModel
		fork: [semaphore signal. [connectionB := initiator connect] ensure: [semaphore signal]]
		named: 'Pending InitiateConnection'.
	semaphore wait.
	connectionA := acceptor waitForConnection.
	semaphore wait.
	self
		assert: connectionA isOpen;
		assert: connectionB isOpen.
	connectionA close.
	connectionB close
]
