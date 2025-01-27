"
This class serves as the abstract superclass for the classes which implement the actual handshake protocol.

When the Client opens a Socket to the Server, it is responsible for sending the first message.

Client -> Server: SupportedVersions
Server -> Client:
	alt: The Server and Client have overlap in their supported versions
		- Server -> Client: ChosenVersion
	alt: No overlap exists between the Client and Server.
		- Server -> Client: NoVersionOverlap
		- Server: Closes socket
"
Class {
	#name : 'RsrProtocolVersionNegotiation',
	#superclass : 'RsrHandshakeStep',
	#instVars : [
		'wireProtocols'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrProtocolVersionNegotiation class >> new [

	^self wireProtocols: { RsrWireProtocolV2 new }
]

{ #category : 'instance creation' }
RsrProtocolVersionNegotiation class >> wireProtocols: aPrioritizedListOfWireProtocols [

	^super new
		wireProtocols: aPrioritizedListOfWireProtocols;
		yourself
]

{ #category : 'accessing' }
RsrProtocolVersionNegotiation >> codec [

	^RsrProtocolVersionNegotiationCodec new
]

{ #category : 'accessing' }
RsrProtocolVersionNegotiation >> wireProtocols [
	"Return the supported protocols."

	^wireProtocols
]

{ #category : 'accessing' }
RsrProtocolVersionNegotiation >> wireProtocols: aPrioritizedListOfWireProtocols [
	"Configure the list and priority of supported wire protocols."

	wireProtocols := aPrioritizedListOfWireProtocols
]
