Class {
	#name : 'RsrProtocolVersionNegotiationCodecTestCase',
	#superclass : 'RsrTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrProtocolVersionNegotiationCodecTestCase >> codec [

	^RsrProtocolVersionNegotiationCodec new
]

{ #category : 'utilities' }
RsrProtocolVersionNegotiationCodecTestCase >> stream: aBlock [

	^ByteArray streamContents: [:stream | aBlock value: stream]
]

{ #category : 'running' }
RsrProtocolVersionNegotiationCodecTestCase >> testChosenVersion [

	| chosenVersion encoding result |
	chosenVersion := RsrChosenVersion version: 7.
	encoding :=
		#[0 0 0 0 0 0 0 1], "Type"
		#[0 0 0 0 0 0 0 7]. "Version"
	result := self stream: [:stream | self codec encodeChosenVersion: chosenVersion onto: stream].
	self
		assert: result
		equals: encoding.
	result := self codec decode: encoding readStream.
	self
		assert: result
		equals: chosenVersion
]

{ #category : 'running' }
RsrProtocolVersionNegotiationCodecTestCase >> testNoVersionOverlap [

	| noVersionOverlap encoding result |
	noVersionOverlap := RsrNoVersionOverlap new.
	encoding := #[0 0 0 0 0 0 0 2]. "Type"
	result := self stream: [:stream | self codec encodeNoVersionOverlap: noVersionOverlap onto: stream].
	self
		assert: result
		equals: encoding.
	result := self codec decode: encoding readStream.
	self
		assert: result
		equals: noVersionOverlap
]

{ #category : 'running' }
RsrProtocolVersionNegotiationCodecTestCase >> testSupportedVersions [

	| supportedVersions encoding result |
	supportedVersions := RsrSupportedVersions versions: #(0 1 2 7).
	encoding :=
		#[0 0 0 0 0 0 0 0], "Type"
		#[0 0 0 0 0 0 0 4], "4 versions supported"
		#[0 0 0 0 0 0 0 0],
		#[0 0 0 0 0 0 0 1],
		#[0 0 0 0 0 0 0 2],
		#[0 0 0 0 0 0 0 7].
	result := self stream: [:stream | self codec encodeSupportedVersions: supportedVersions onto: stream].
	self
		assert: result
		equals: encoding.
	result := self codec decode: encoding readStream.
	self
		assert: result
		equals: supportedVersions
]
