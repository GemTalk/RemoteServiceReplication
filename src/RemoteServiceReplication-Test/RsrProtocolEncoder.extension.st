Extension { #name : 'RsrProtocolEncoder' }

{ #category : '*RemoteServiceReplication-Test' }
RsrProtocolEncoder >> encodeDeliverResponse: aDeliverResponse [

	^ByteArray streamContents: [:stream | self encodeDeliverResponse: aDeliverResponse onto: stream]
]

{ #category : '*RemoteServiceReplication-Test' }
RsrProtocolEncoder >> encodeReleaseServices: aReleaseServices [

	^ByteArray streamContents: [:stream | self encodeReleaseServices: aReleaseServices onto: stream]
]

{ #category : '*RemoteServiceReplication-Test' }
RsrProtocolEncoder >> encodeSendMessage: aSendMessage [

	^ByteArray streamContents: [:stream | self encodeSendMessage: aSendMessage onto: stream]
]

{ #category : '*RemoteServiceReplication-Test' }
RsrProtocolEncoder >> encodeServiceSnapshot: aServiceSnapshot [

	^ByteArray
		streamContents:
			[:stream |
			self
				encodeServiceSnapshot: aServiceSnapshot
				onto: stream]
]
