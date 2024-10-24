Class {
	#name : 'RsrProtocolVersionNegotiationCodec',
	#superclass : 'RsrCodec',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrProtocolVersionNegotiationCodec >> chosenVersionIdentifier [

	^1
]

{ #category : 'decoding' }
RsrProtocolVersionNegotiationCodec >> decode: aStream [
	"Decode a message from <aStream>"

	| identifier |
	identifier := self decodeControlWord: aStream.
	identifier = self supportedVersionsIdentifier
		ifTrue: [^self decodeSupportedVersions: aStream].
	identifier = self chosenVersionIdentifier
		ifTrue: [^self decodeChosenVersion: aStream].
	identifier = self noVersionOverlapIdentifier
		ifTrue: [^self decodeNoVersionOverlap: aStream].
	^RsrProtocolVersionNegotiationFailed signal: 'Unknown identifier: ', identifier printString
]

{ #category : 'decoding' }
RsrProtocolVersionNegotiationCodec >> decodeChosenVersion: aStream [

	| version |
	version := self decodeControlWord: aStream.
	^RsrChosenVersion version: version
]

{ #category : 'decoding' }
RsrProtocolVersionNegotiationCodec >> decodeNoVersionOverlap: aStream [

	^RsrNoVersionOverlap new
]

{ #category : 'decoding' }
RsrProtocolVersionNegotiationCodec >> decodeSupportedVersions: aStream [

	| numberOfVersions versions |
	numberOfVersions := self decodeControlWord: aStream.
	versions := (1 to: numberOfVersions) collect: [:each | self decodeControlWord: aStream].
	^RsrSupportedVersions versions: versions
]

{ #category : 'encoding' }
RsrProtocolVersionNegotiationCodec >> encodeChosenVersion: aChosenVersion
onto: aStream [

	self
		encodeControlWord: self chosenVersionIdentifier
		onto: aStream.
	self
		encodeControlWord: aChosenVersion version
		onto: aStream
]

{ #category : 'encoding' }
RsrProtocolVersionNegotiationCodec >> encodeNoVersionOverlap: aNoVersionOverlap
onto: aStream [

	self
		encodeControlWord: self noVersionOverlapIdentifier
		onto: aStream
]

{ #category : 'encoding' }
RsrProtocolVersionNegotiationCodec >> encodeSupportedVersions: aSupportedVersions
onto: aStream [

	| versions |
	versions := aSupportedVersions versions.
	self
		encodeControlWord: self supportedVersionsIdentifier
		onto: aStream.
	self
		encodeControlWord: versions size
		onto: aStream.
	versions do: [:each | self encodeControlWord: each onto: aStream]
]

{ #category : 'accessing' }
RsrProtocolVersionNegotiationCodec >> noVersionOverlapIdentifier [

	^2
]

{ #category : 'accessing' }
RsrProtocolVersionNegotiationCodec >> supportedVersionsIdentifier [

	^0
]
