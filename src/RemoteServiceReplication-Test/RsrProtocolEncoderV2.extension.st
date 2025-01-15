Extension { #name : 'RsrProtocolEncoderV2' }

{ #category : '*RemoteServiceReplication-Test' }
RsrProtocolEncoderV2 >> encodeDeliverResponse: aDeliverResponse [

	^ByteArray streamContents: [:stream | self encodeDeliverResponse: aDeliverResponse onto: stream]
]

{ #category : '*RemoteServiceReplication-Test' }
RsrProtocolEncoderV2 >> encodeReleaseServices: aReleaseServices [

	^ByteArray streamContents: [:stream | self encodeReleaseServices: aReleaseServices onto: stream]
]

{ #category : '*RemoteServiceReplication-Test' }
RsrProtocolEncoderV2 >> encodeSendMessage: aSendMessage [

	^ByteArray streamContents: [:stream | self encodeSendMessage: aSendMessage onto: stream]
]

{ #category : '*RemoteServiceReplication-Test' }
RsrProtocolEncoderV2 >> encodeServiceSnapshot: aServiceSnapshot [

	^ByteArray
		streamContents:
			[:stream |
			self
				encodeServiceSnapshot: aServiceSnapshot
				onto: stream]
]
