"
This class is abstract and defines the interface for manufacturing RsrConnection instances which are connected to a peer.

Specialized subclasses are reponsible for either listening for or initiating connections with a peer.
"
Class {
	#name : 'RsrSocketConnectionSpecification',
	#superclass : 'RsrConnectionSpecification',
	#instVars : [
		'host',
		'port'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrSocketConnectionSpecification class >> host: hostnameOrAddress
port: port [

	^self new
		host: hostnameOrAddress;
		port: port;
		yourself
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
RsrSocketConnectionSpecification >> port [
	"The port number used for establishing a socket"

	^port
]

{ #category : 'accessing' }
RsrSocketConnectionSpecification >> port: aPort [
	"The port number used for establishing a socket"

	port := aPort
]

{ #category : 'accessing' }
RsrSocketConnectionSpecification >> socketClass [
	"Return the class that should be used for creating Socket instances."

	^RsrSocket
]
