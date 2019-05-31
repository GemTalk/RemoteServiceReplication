Class {
	#name : #RsrCodec,
	#superclass : #Object,
	#category : #'RemoteServiceReplication-Communications'
}

{ #category : #'private-accessing' }
RsrCodec >> arrayType [

	^9
]

{ #category : #'private-accessing' }
RsrCodec >> characterType [

	^5
]

{ #category : #'private-accessing' }
RsrCodec >> controlWordMax [

	^(2 raisedTo: 63) -1
]

{ #category : #'private-accessing' }
RsrCodec >> controlWordMin [

	^(2 raisedTo: 63) negated
]

{ #category : #'private-accessing' }
RsrCodec >> deliverResponseCommand [

	^2
]

{ #category : #'private-accessing' }
RsrCodec >> falseType [

	^8
]

{ #category : #'private-testing' }
RsrCodec >> isImmediate: anObject [

	^anObject isSymbol
		or: [anObject isString
			or: [anObject isInteger
				or: [anObject isCharacter
					or: [#(nil true false) includes: anObject]]]]
]

{ #category : #'private-accessing' }
RsrCodec >> negativeIntegerType [

	^4
]

{ #category : #'private-accessing' }
RsrCodec >> nilType [

	^6
]

{ #category : #'private-accessing' }
RsrCodec >> positiveIntegerType [

	^3
]

{ #category : #'private-encoding' }
RsrCodec >> reflectedVariableNamesOf: aService [

	^aService class variablesToReflect
]

{ #category : #'private-encoding' }
RsrCodec >> reflectedVariableNamesOf: anRsrObject
do: aBlock [

	anRsrObject class variablesToReflect
		do:
			[:name |
			aBlock value: name]
]

{ #category : #'private-accessing' }
RsrCodec >> releaseObjectsCommand [

	^3
]

{ #category : #'private-accessing' }
RsrCodec >> retainObjectCommand [

	^0
]

{ #category : #'private-accessing' }
RsrCodec >> sendMessageCommand [

	^1
]

{ #category : #'private-accessing' }
RsrCodec >> serviceType [

	^0
]

{ #category : #'private-accessing' }
RsrCodec >> sizeOfInteger [
	"Return the number of bytes used to encode an integer"

	^8
]

{ #category : #'private-accessing' }
RsrCodec >> stringType [

	^2
]

{ #category : #'private-accessing' }
RsrCodec >> symbolType [

	^1
]

{ #category : #'private-accessing' }
RsrCodec >> trueType [

	^7
]