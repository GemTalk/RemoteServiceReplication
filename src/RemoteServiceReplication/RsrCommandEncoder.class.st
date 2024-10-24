Class {
	#name : 'RsrCommandEncoder',
	#superclass : 'RsrCommandCodec',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'private-encoding' }
RsrCommandEncoder >> encodeDeliverResponse: aDeliverResponse [

	^ByteArray streamContents: [:stream | self encodeDeliverResponse: aDeliverResponse onto: stream]
]

{ #category : 'private-encoding' }
RsrCommandEncoder >> encodeDeliverResponse: aDeliverResponse
onto: aStream [

	self
		encodeControlWord: self deliverResponseCommand
		onto: aStream.
	self
		encodeControlWord: aDeliverResponse transaction
		onto: aStream.
	self
		encodeControlWord: aDeliverResponse snapshots size
		onto: aStream.
	aDeliverResponse snapshots do: [:each | self encodeServiceSnapshot: each onto: aStream].
	self
		encodeReference: aDeliverResponse response
		onto: aStream
]

{ #category : 'private-encoding' }
RsrCommandEncoder >> encodeReference: aReference
onto: aStream [

	aReference
		encode: aStream
		using: self
]

{ #category : 'private-encoding' }
RsrCommandEncoder >> encodeReleaseServices: aReleaseServices [

	^ByteArray streamContents: [:stream | self encodeReleaseServices: aReleaseServices onto: stream]
]

{ #category : 'private-encoding' }
RsrCommandEncoder >> encodeReleaseServices: aReleaseServices
onto: aStream [

	self
		encodeControlWord: self releaseObjectsCommand
		onto: aStream.
	self
		encodeControlWord: aReleaseServices sids size
		onto: aStream.
	aReleaseServices sids
		do:
			[:sid |
			self
				encodeControlWord: sid
				onto: aStream]
]

{ #category : 'private-encoding' }
RsrCommandEncoder >> encodeSendMessage: aSendMessage [

	^ByteArray streamContents: [:stream | self encodeSendMessage: aSendMessage onto: stream]
]

{ #category : 'private-encoding' }
RsrCommandEncoder >> encodeSendMessage: aSendMessage
onto: aStream [

	self
		encodeControlWord: self sendMessageCommand
		onto: aStream.
	self
		encodeControlWord: aSendMessage transaction
		onto: aStream.
	self
		encodeControlWord: aSendMessage snapshots size
		onto: aStream.
	aSendMessage snapshots
		do:
			[:each |
			self
				encodeServiceSnapshot: each
				onto: aStream].
	self
		encodeReference:  aSendMessage receiverReference
		onto: aStream.
	self
		encodeReference: aSendMessage selectorReference
		onto: aStream.
	self
		encodeControlWord: aSendMessage argumentReferences size
		onto: aStream.
	aSendMessage argumentReferences
		do:
			[:each |
			self
				encodeReference: each
				onto: aStream]
]

{ #category : 'encoding' }
RsrCommandEncoder >> encodeServiceSnapshot: aServiceSnapshot [

	^ByteArray
		streamContents:
			[:stream |
			self
				encodeServiceSnapshot: aServiceSnapshot
				onto: stream]
]

{ #category : 'private-encoding' }
RsrCommandEncoder >> encodeServiceSnapshot: aServiceSnapshot
onto: aStream [

	aServiceSnapshot
		encode: aStream
		using: self
]
