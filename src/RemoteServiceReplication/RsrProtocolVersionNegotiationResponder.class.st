Class {
	#name : 'RsrProtocolVersionNegotiationResponder',
	#superclass : 'RsrProtocolVersionNegotiation',
	#category : 'RemoteServiceReplication'
}

{ #category : 'handshaking' }
RsrProtocolVersionNegotiationResponder >> performForChannel: aChannel [
	"Peform the responder's side of the handshake."

	| readStream writeStream codec supportedVersions |
	readStream := aChannel readStream.
	writeStream := aChannel writeStream.
	codec := self newCodec.
	
	supportedVersions :=  codec decode: readStream.
	(supportedVersions versions includes: 1)
		ifTrue:
			[ codec
				encodeChosenVersion: (RsrChosenVersion version: 1)
				onto: writeStream.
			writeStream flush]
		ifFalse:
			[ codec
				encodeNoVersionOverlap: RsrNoVersionOverlap new
				onto: writeStream.
			writeStream flush; close.
			^RsrProtocolVersionNegotiationFailed signal: 'The parties could not agree on an RSR protocol version.']
]

{ #category : 'handshaking' }
RsrProtocolVersionNegotiationResponder >> performOver: aStream [
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
