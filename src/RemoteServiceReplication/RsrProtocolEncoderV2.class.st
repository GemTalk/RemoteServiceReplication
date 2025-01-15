Class {
	#name : 'RsrProtocolEncoderV2',
	#superclass : 'RsrProtocolEncoder',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'encoding-services' }
RsrProtocolEncoderV2 >> encodeServiceSnapshot: aServiceSnapshot
onto: aStream [

	self
		encodeControlWord: self snapshotIdentifier
		onto: aStream.
	self
		encodeControlWord: aServiceSnapshot sid
		onto: aStream.
	self
		encodeControlWord: aServiceSnapshot slots size
		onto: aStream.
	aServiceSnapshot templateNameReference
		encode: aStream
		using: self.
	aServiceSnapshot personaReference
		encode: aStream
		using: self.
	aServiceSnapshot slots do: [:each | each encode: aStream using: self]
]
