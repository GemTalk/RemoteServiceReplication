Class {
	#name : 'RsrProtocolCodec',
	#superclass : 'RsrCodec',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'accessing-types' }
RsrProtocolCodec >> arrayIdentifier [

	^9
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> byteArrayIdentifier [

	^10
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> characterIdentifier [

	^5
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> dateAndTimeIdentifier [

	^14
]

{ #category : 'private-accessing-commands' }
RsrProtocolCodec >> deliverErrorResponseCommand [

	^4
]

{ #category : 'private-accessing-commands' }
RsrProtocolCodec >> deliverResponseCommand [

	^2
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> dictionaryIdentifier [

	^13
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> doubleIdentifier [

	^15
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> falseIdentifier [

	^8
]

{ #category : 'private-accessing' }
RsrProtocolCodec >> immediateOID [

	^0
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> negativeIntegerIdentifier [

	^4
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> nilIdentifier [

	^6
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> orderedCollectionIdentifier [

	^12
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> positiveIntegerIdentifier [

	^3
]

{ #category : 'private-accessing-commands' }
RsrProtocolCodec >> releaseObjectsCommand [

	^3
]

{ #category : 'private-accessing-commands' }
RsrProtocolCodec >> sendMessageCommand [

	^1
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> setIdentifier [

	^11
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> snapshotIdentifier [

	^0
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> stringIdentifier [

	^2
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> symbolIdentifier [

	^1
]

{ #category : 'accessing-types' }
RsrProtocolCodec >> trueIdentifier [

	^7
]
