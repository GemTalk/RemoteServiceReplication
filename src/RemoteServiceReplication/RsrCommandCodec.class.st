Class {
	#name : 'RsrCommandCodec',
	#superclass : 'RsrCodec',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'private-accessing-commands' }
RsrCommandCodec >> deliverErrorResponseCommand [

	^4
]

{ #category : 'private-accessing-commands' }
RsrCommandCodec >> deliverResponseCommand [

	^2
]

{ #category : 'private-accessing' }
RsrCommandCodec >> immediateOID [

	^0
]

{ #category : 'private-accessing-commands' }
RsrCommandCodec >> releaseObjectsCommand [

	^3
]

{ #category : 'private-accessing-commands' }
RsrCommandCodec >> sendMessageCommand [

	^1
]
