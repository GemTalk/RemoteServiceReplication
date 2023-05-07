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
	#category : 'RemoteServiceReplication-Base'
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

{ #category : 'accessing' }
RsrDictionaryReference class >> typeIdentifier [

	^13
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
		encodeControlWord: anEncoder immediateOID
		onto: aStream.
	anEncoder
		encodeControlWord: self typeIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: intermediate size / 2
		onto: aStream.
	intermediate do: [:each | each encode: aStream using: anEncoder]
]

{ #category : 'resolving' }
RsrDictionaryReference >> resolve: anRsrSession [

	| stream numEntries dictionary |
	stream := ReadStream on: intermediate.
	numEntries := intermediate size / 2.
	dictionary := Dictionary new: numEntries.
	numEntries
		timesRepeat:
			[dictionary
				at: (stream next resolve: anRsrSession)
				put: (stream next resolve: anRsrSession)].
	^dictionary
]
