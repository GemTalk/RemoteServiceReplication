Class {
	#name : 'RsrInternalSocketConnectionSpecification',
	#superclass : 'RsrInternalConnectionSpecification',
	#category : 'RemoteServiceReplication'
}

{ #category : 'connecting' }
RsrInternalSocketConnectionSpecification >> connect [
	"Establish an internal Connection pair via socket."

	| acceptor initiator |
	acceptor := RsrAcceptConnection port: self defaultPort.
	initiator := RsrInitiateConnection host: '127.0.0.1' port: self defaultPort.
	RsrProcessModel
		fork: [connectionA := acceptor waitForConnection]
		named: 'Pending AcceptConnection'.
	self flag: #GetRidOfMinimalWait.
	self minimalWait. "Allow other process to schedule."
	connectionB := initiator connect.
	self minimalWait. "Allow other process to schedule."
	self assertOpen.
	connectionA specification: self.
	connectionB specification: self.
	^connectionA
]

{ #category : 'accessing' }
RsrInternalSocketConnectionSpecification >> defaultPort [
	"Returns the default port number used to listen for connections."

	^61982
]
