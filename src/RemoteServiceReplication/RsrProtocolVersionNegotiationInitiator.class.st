Class {
	#name : 'RsrProtocolVersionNegotiationInitiator',
	#superclass : 'RsrProtocolVersionNegotiation',
	#category : 'RemoteServiceReplication'
}

{ #category : 'handshaking' }
RsrProtocolVersionNegotiationInitiator >> performForChannel: aChannel [

	"Perform the initiator's role in the handshake"

	| readStream writeStream codec supportedVersions answer |
	readStream := aChannel readStream.
	writeStream := aChannel writeStream.
	codec := self newCodec.
	supportedVersions := RsrSupportedVersions versions: #( 1 ).
	codec encodeSupportedVersions: supportedVersions onto: writeStream.
	writeStream flush.
	answer := codec decode: readStream.
	answer hasSharedVersion ifFalse: [ 
		^ RsrProtocolVersionNegotiationFailed signal:
			  'The parties could not agree on an RSR protocol version.' ]
]
