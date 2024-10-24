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
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrProtocolVersionNegotiation >> codec [

	^RsrProtocolVersionNegotiationCodec new
]
