Class {
	#name : 'RsrSocketStreamTestCase',
	#superclass : 'RsrTestCase',
	#instVars : [
		'aStream',
		'bStream'
	],
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'initializing' }
RsrSocketStreamTestCase >> initializeStreams [

	| socketPair |
	socketPair := RsrSocketPair new.
	aStream := socketPair firstStream.
	bStream := socketPair secondStream
]

{ #category : 'initializing' }
RsrSocketStreamTestCase >> setUp [

	super setUp.
	self initializeStreams
]

{ #category : 'initializing' }
RsrSocketStreamTestCase >> tearDown [

	aStream close.
	bStream close.
	super tearDown
]

{ #category : 'running' }
RsrSocketStreamTestCase >> testNextAfterClose [

	aStream close.
	self
		should: [aStream next]
		raise: RsrSocketClosed.
	self
		should: [bStream next]
		raise: RsrSocketClosed
]

{ #category : 'running' }
RsrSocketStreamTestCase >> testNextPutAllAfterClose [

	self deny: aStream atEnd.
	aStream close.
	self assert: aStream atEnd.
	self
		should: [ 
			aStream
				nextPutAll: #[ 1 2 3 ];
				flush ]
		raise: RsrSocketClosed
]

{ #category : 'running' }
RsrSocketStreamTestCase >> testSendReceive [

	| count bytes |
	count := 1024.
	bytes := ByteArray new: count.
	aStream
		nextPutAll: bytes;
		flush.
	self
		assert: (bStream next: count)
		equals: bytes
]
