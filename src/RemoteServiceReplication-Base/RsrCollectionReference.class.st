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

	aDecoder
		decodeCollectionReference: self
		from: aStream
]
