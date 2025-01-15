Class {
	#name : 'RsrProtocolEncoderV1',
	#superclass : 'RsrProtocolEncoder',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'encoding-services' }
RsrProtocolEncoderV1 >> encodeServiceSnapshot: aServiceSnapshot
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
	(self targetClassReferenceFor: aServiceSnapshot)
		encode: aStream
		using: self.
	aServiceSnapshot slots do: [:each | each encode: aStream using: self]
]

{ #category : 'accessing' }
RsrProtocolEncoderV1 >> targetClassReferenceFor: aServiceSnapshot [

	| template targetClassName |
	template := RsrClassResolver classNamed: aServiceSnapshot templateName.
	targetClassName := aServiceSnapshot shouldCreateServer
		ifTrue: [template serverClassName]
		ifFalse: [template clientClassName].
	^RsrSymbolReference from: targetClassName
]
