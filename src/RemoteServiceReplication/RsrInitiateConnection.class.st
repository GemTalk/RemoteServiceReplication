"
This class is responsible for initating a new RsrConnection. Sending #connect will result in an attempt to connect to the specified host and port. #connect is responsible for initating the attempted connection. If successful, an instance of RsrConnection is returned as a result.

Example: 

| initiator |
initiator := RsrInitiateConnection
	host: '127.0.0.1'
	port: 51820.
^initiator connect
"
Class {
	#name : 'RsrInitiateConnection',
	#superclass : 'RsrSocketConnectionSpecification',
	#instVars : [
		'port',
		'token'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrInitiateConnection class >> host: hostnameOrAddress port: port [

	^self
		host: hostnameOrAddress
		port: port
		wireProtocols: self defaultWireProtocols
]

{ #category : 'instance creation' }
RsrInitiateConnection class >> host: hostnameOrAddress
port: port
wireProtocols: prioritizedProtocols [

	^self new
		host: hostnameOrAddress;
		port: port;
		wireProtocols: prioritizedProtocols;
		yourself
]

{ #category : 'connecting' }
RsrInitiateConnection >> connect [

	| socket stream handshake channel connection |
	socket := self socketClass new.
	socket
		connectToHost: self host
		port: self port.
	stream := socket bufferedSocketStream.
	handshake := RsrHandshake
		steps: self handshakeSteps
		stream: stream.
	handshake perform.
	channel := RsrBinaryStreamChannel
		wireProtocol: handshake wireProtocol
		inStream: stream
		outStream: stream.
	connection := RsrConnection
		specification: self
		channel: channel
		transactionSpigot: RsrThreadSafeNumericSpigot naturals negated
		oidSpigot: RsrThreadSafeNumericSpigot naturals negated.
	^connection open
]

{ #category : 'accessing' }
RsrInitiateConnection >> handshakeSteps [
	"Returns a sequence of steps needed to perform a successful handshake."

	^Array
		with: (RsrProtocolVersionNegotiationClient wireProtocols: self wireProtocols)
]

{ #category : 'accessing' }
RsrInitiateConnection >> port [
	"The port number used for establishing a socket"

	^port
]

{ #category : 'accessing' }
RsrInitiateConnection >> port: aPort [
	"The port number used for establishing a socket"

	port := aPort
]
