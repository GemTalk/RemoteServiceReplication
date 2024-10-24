Class {
	#name : 'RsrProtocolVersionNegotiationServer',
	#superclass : 'RsrProtocolVersionNegotiation',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'handshaking' }
RsrProtocolVersionNegotiationServer >> performOver: aStream [
	"Peform the Server's side of the handshake."

	| supportedVersions |
	supportedVersions := self codec decode: aStream.
	(supportedVersions versions includes: 1)
		ifTrue:
			[self codec
				encodeChosenVersion: (RsrChosenVersion version: 1)
				onto: aStream.
			aStream flush]
		ifFalse:
			[self codec
				encodeNoVersionOverlap: RsrNoVersionOverlap new
				onto: aStream.
			aStream flush; close.
			^RsrProtocolVersionNegotiationFailed signal: 'Client versions did not overlap w/ Server']
]
