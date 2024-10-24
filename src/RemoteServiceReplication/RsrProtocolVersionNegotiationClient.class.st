Class {
	#name : 'RsrProtocolVersionNegotiationClient',
	#superclass : 'RsrProtocolVersionNegotiation',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'handshaking' }
RsrProtocolVersionNegotiationClient >> performOver: aStream [
	"Perform the Client's porition of the handshake"

	| supportedVersions answer |
	supportedVersions := RsrSupportedVersions versions: #(1).
	self codec
		encodeSupportedVersions: supportedVersions
		onto: aStream.
	aStream flush.
	answer := self codec decode: aStream.
	answer hasSharedVersion
		ifFalse: [^RsrProtocolVersionNegotiationFailed signal: 'The Client and Server could not agree on an RSR protocol version.']
]
