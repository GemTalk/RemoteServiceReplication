Class {
	#name : 'RsrProtocolVersionNegotiationServer',
	#superclass : 'RsrProtocolVersionNegotiation',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'performing' }
RsrProtocolVersionNegotiationServer >> performFor: aHandshake
over: aStream [
	"Perform the Server's side of the handshake."

	| supportedVersions selectedProtocol |
	supportedVersions := self codec decode: aStream.
	selectedProtocol := self wireProtocols
		detect: [:protocol | supportedVersions versions includes: protocol version]
		ifNone:
			[self codec
				encodeNoVersionOverlap: RsrNoVersionOverlap new
				onto: aStream.
			aStream flush; close.
			^RsrProtocolVersionNegotiationFailed signal: 'Client versions do not overlap w/ Server'].
	self codec
		encodeChosenVersion: (RsrChosenVersion version: selectedProtocol version)
		onto: aStream.
	aStream flush.
	aHandshake wireProtocol: selectedProtocol
]
