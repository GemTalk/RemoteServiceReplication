Class {
	#name : 'RsrInternalSocketConnectionSpecification',
	#superclass : 'RsrInternalConnectionSpecification',
	#instVars : [
		'wireProtocols'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrInternalSocketConnectionSpecification class >> new [
	"Create a Spec w/ WireProtocolV2."

	^self wireProtocols: { RsrWireProtocolV2 new }
]

{ #category : 'instance creation' }
RsrInternalSocketConnectionSpecification class >> wireProtocols: prioritizedWireProtocols [
	"Create a Spec w/ a specific set of supported WireProtocols."

	^super new
		wireProtocols: prioritizedWireProtocols;
		yourself
]

{ #category : 'connecting' }
RsrInternalSocketConnectionSpecification >> connect [
	"Establish an internal Connection pair via socket."

	| acceptor initiator |
	acceptor := RsrAcceptConnection port: self defaultPort wireProtocols: self wireProtocols.
	initiator := RsrInitiateConnection host: '127.0.0.1' port: self defaultPort wireProtocols: self wireProtocols.
	RsrProcessModel
		fork: [connectionA := acceptor waitForConnection]
		named: 'Pending AcceptConnection'.
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

{ #category : 'waiting' }
RsrInternalSocketConnectionSpecification >> minimalWait [
	"Ensure the calling process is not schedulable for a short period of time."

	(Delay forMilliseconds: 1) wait
]

{ #category : 'accessing' }
RsrInternalSocketConnectionSpecification >> wireProtocols [
	"Configured WireProtocols to be used during negotiation."

	^wireProtocols
]

{ #category : 'accessing' }
RsrInternalSocketConnectionSpecification >> wireProtocols: prioritizedWireProtocols [
	"Configured WireProtocols to be used during negotiation."

	wireProtocols := prioritizedWireProtocols
]
