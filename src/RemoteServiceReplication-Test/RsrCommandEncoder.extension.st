Extension { #name : 'RsrCommandEncoder' }

{ #category : '*RemoteServiceReplication-Test' }
RsrCommandEncoder >> encodeDeliverResponse: aDeliverResponse [

	^ByteArray streamContents: [:stream | self encodeDeliverResponse: aDeliverResponse onto: stream]
]

{ #category : '*RemoteServiceReplication-Test' }
RsrCommandEncoder >> encodeReleaseServices: aReleaseServices [

	^ByteArray streamContents: [:stream | self encodeReleaseServices: aReleaseServices onto: stream]
]

{ #category : '*RemoteServiceReplication-Test' }
RsrCommandEncoder >> encodeSendMessage: aSendMessage [

	^ByteArray streamContents: [:stream | self encodeSendMessage: aSendMessage onto: stream]
]

{ #category : '*RemoteServiceReplication-Test' }
RsrCommandEncoder >> encodeServiceSnapshot: aServiceSnapshot [

	^ByteArray
		streamContents:
			[:stream |
			self
				encodeServiceSnapshot: aServiceSnapshot
				onto: stream]
]
