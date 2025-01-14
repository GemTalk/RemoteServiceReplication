Class {
	#name : 'RsrCommandCodec',
	#superclass : 'RsrCodec',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'accessing-types' }
RsrCommandCodec >> arrayIdentifier [

	^9
]

{ #category : 'accessing-types' }
RsrCommandCodec >> byteArrayIdentifier [

	^10
]

{ #category : 'accessing-types' }
RsrCommandCodec >> characterIdentifier [

	^5
]

{ #category : 'accessing-types' }
RsrCommandCodec >> dateAndTimeIdentifier [

	^14
]

{ #category : 'private-accessing-commands' }
RsrCommandCodec >> deliverErrorResponseCommand [

	^4
]

{ #category : 'private-accessing-commands' }
RsrCommandCodec >> deliverResponseCommand [

	^2
]

{ #category : 'accessing-types' }
RsrCommandCodec >> dictionaryIdentifier [

	^13
]

{ #category : 'accessing-types' }
RsrCommandCodec >> doubleIdentifier [

	^15
]

{ #category : 'accessing-types' }
RsrCommandCodec >> falseIdentifier [

	^8
]

{ #category : 'private-accessing' }
RsrCommandCodec >> immediateOID [

	^0
]

{ #category : 'accessing-types' }
RsrCommandCodec >> negativeIntegerIdentifier [

	^4
]

{ #category : 'accessing-types' }
RsrCommandCodec >> nilIdentifier [

	^6
]

{ #category : 'accessing-types' }
RsrCommandCodec >> orderedCollectionIdentifier [

	^12
]

{ #category : 'accessing-types' }
RsrCommandCodec >> positiveIntegerIdentifier [

	^3
]

{ #category : 'private-accessing-commands' }
RsrCommandCodec >> releaseObjectsCommand [

	^3
]

{ #category : 'private-accessing-commands' }
RsrCommandCodec >> sendMessageCommand [

	^1
]

{ #category : 'accessing-types' }
RsrCommandCodec >> setIdentifier [

	^11
]

{ #category : 'accessing-types' }
RsrCommandCodec >> snapshotIdentifier [

	^0
]

{ #category : 'accessing-types' }
RsrCommandCodec >> stringIdentifier [

	^2
]

{ #category : 'accessing-types' }
RsrCommandCodec >> symbolIdentifier [

	^1
]

{ #category : 'accessing-types' }
RsrCommandCodec >> trueIdentifier [

	^7
]
