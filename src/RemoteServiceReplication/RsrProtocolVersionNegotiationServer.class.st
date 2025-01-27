Class {
	#name : 'RsrProtocolVersionNegotiationServer',
	#superclass : 'RsrProtocolVersionNegotiation',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'performing' }
RsrProtocolVersionNegotiationServer >> performFor: aHandshake
over: aStream [
	"Peform the Server's side of the handshake."

	| supportedVersions |
	supportedVersions := self codec decode: aStream.
	(supportedVersions versions includes: 2)
		ifFalse:
			[self codec
				encodeNoVersionOverlap: RsrNoVersionOverlap new
				onto: aStream.
			aStream flush; close.
			^RsrProtocolVersionNegotiationFailed signal: 'Client versions did not overlap w/ Server'].
	self codec
		encodeChosenVersion: (RsrChosenVersion version: 2)
		onto: aStream.
	aStream flush.
	aHandshake wireProtocol: RsrWireProtocolV2 new
]
