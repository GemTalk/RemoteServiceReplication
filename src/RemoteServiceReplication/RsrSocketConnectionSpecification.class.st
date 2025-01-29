"
This class is abstract and defines the interface for manufacturing RsrConnection instances which are connected to a peer.

Specialized subclasses are reponsible for either listening for or initiating connections with a peer.
"
Class {
	#name : 'RsrSocketConnectionSpecification',
	#superclass : 'RsrConnectionSpecification',
	#instVars : [
		'host',
		'wireProtocols'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrSocketConnectionSpecification class >> defaultWireProtocols [
	"Return the default list of supported WireProtocol version."

	^{ RsrWireProtocolV2 new. RsrWireProtocolV1 new }
]

{ #category : 'accessing' }
RsrSocketConnectionSpecification >> host [
	"Return the configured hostname or IP address"

	^host
]

{ #category : 'accessing' }
RsrSocketConnectionSpecification >> host: hostnameOrAddress [
	"The hostname or IP address used to establish a connection."

	host := hostnameOrAddress
]

{ #category : 'accessing' }
RsrSocketConnectionSpecification >> socketClass [
	"Return the class that should be used for creating Socket instances."

	^RsrSocket
]

{ #category : 'accessing' }
RsrSocketConnectionSpecification >> wireProtocols [
	"Returns the prioritized protocols that should be used
	when negotiating a connection."

	^wireProtocols ifNil: [^self class defaultWireProtocols]
]

{ #category : 'accessing' }
RsrSocketConnectionSpecification >> wireProtocols: prioritizedWireProtocols [
	"Configure the list of supported WireProtocols."

	wireProtocols := prioritizedWireProtocols
]
