"
No class-specific documentation for RsrCollectionReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrCollectionReference

"
Class {
	#name : 'RsrCollectionReference',
	#superclass : 'RsrValueReference',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'analyzing' }
RsrCollectionReference class >> analyze: aCollection
using: anAnalyzer [

	^anAnalyzer analyzeCollection: aCollection
]

{ #category : 'instance creation' }
RsrCollectionReference class >> from: aSequencedCollection [

	| references |
	references := (1 to: aSequencedCollection size) collect: [:i | RsrReference from: (aSequencedCollection at: i)].
	^self intermediate: references
]

{ #category : 'encoding/decoding' }
RsrCollectionReference >> decode: aStream
using: aDecoder [

	| size |
	size := aDecoder decodeControlWord: aStream.
	intermediate := (1 to: size) collect: [:i | aDecoder decodeReference: aStream]
]

{ #category : 'encoding/decoding' }
RsrCollectionReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate size
		onto: aStream.
	intermediate
		do:
			[:each |
			each
				encode: aStream
				using: anEncoder]
]
