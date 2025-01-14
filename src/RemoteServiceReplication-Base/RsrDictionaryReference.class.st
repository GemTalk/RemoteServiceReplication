"
No class-specific documentation for RsrDictionaryReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrDictionaryReference

"
Class {
	#name : 'RsrDictionaryReference',
	#superclass : 'RsrCollectionReference',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'analyzing' }
RsrDictionaryReference class >> analyze: aDictionary
using: anAnalyzer [

	^anAnalyzer analyzeDictionary: aDictionary
]

{ #category : 'instance creation' }
RsrDictionaryReference class >> from: aDictionary [

	| referenceStream |
	referenceStream := WriteStream on: (Array new: aDictionary size * 2).
	aDictionary
		keysAndValuesDo:
			[:key :value |
			referenceStream
				nextPut: (RsrReference from: key);
				nextPut: (RsrReference from: value)].
	^self intermediate: referenceStream contents
]

{ #category : 'encoding/decoding' }
RsrDictionaryReference >> decode: aStream
using: aDecoder [

	| size |
	size := aDecoder decodeControlWord: aStream.
	intermediate := (1 to: size * 2) collect: [:each | aDecoder decodeReference: aStream]
]

{ #category : 'encoding/decoding' }
RsrDictionaryReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeDictionaryReference: self
		onto: aStream
]

{ #category : 'resolving' }
RsrDictionaryReference >> resolve: aConnection [

	| stream numEntries dictionary |
	stream := ReadStream on: intermediate.
	numEntries := intermediate size / 2.
	dictionary := Dictionary new: numEntries.
	numEntries
		timesRepeat:
			[dictionary
				at: (stream next resolve: aConnection)
				put: (stream next resolve: aConnection)].
	^dictionary
]
