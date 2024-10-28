Class {
	#name : 'RsrBufferedStream',
	#superclass : 'RsrStream',
	#instVars : [
		'stream',
		'outBuffer',
		'firstByte',
		'nextToWrite'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrBufferedStream class >> on: aSocketStream [

	^self new
		stream: aSocketStream;
		yourself
]

{ #category : 'writing' }
RsrBufferedStream >> atEnd [

	^stream atEnd
]

{ #category : 'writing' }
RsrBufferedStream >> checkAutoFlush [

	nextToWrite > self flushThreshold
		ifTrue: [ self flush ]
]

{ #category : 'writing' }
RsrBufferedStream >> close [

	stream close
]

{ #category : 'writing' }
RsrBufferedStream >> flush [

	firstByte = nextToWrite
		ifTrue: [^self].
	stream nextPutAll: (outBuffer copyFrom: firstByte to: nextToWrite - 1).
	firstByte := nextToWrite := 1.
	stream flush
]

{ #category : 'accessing' }
RsrBufferedStream >> flushThreshold [
	"After how much data should we automatically flush?"

	^self chunkSize
]

{ #category : 'writing' }
RsrBufferedStream >> growOutBufferTo: aNumberOfBytes [

	| rounding |
	rounding := ((aNumberOfBytes // self chunkSize) + 1) * self chunkSize.
	outBuffer := outBuffer , (ByteArray new: rounding - outBuffer size)
]

{ #category : 'initialization' }
RsrBufferedStream >> initialize [

	super initialize.
	outBuffer := ByteArray new: self chunkSize.
	nextToWrite := 1.
	firstByte := 1
]

{ #category : 'writing' }
RsrBufferedStream >> isConnected [

	^stream isConnected
]

{ #category : 'writing' }
RsrBufferedStream >> next [

	^self next: 1
]

{ #category : 'writing' }
RsrBufferedStream >> next: aCount [

	^stream next: aCount
]

{ #category : 'writing' }
RsrBufferedStream >> nextPutAll: aByteArray [

	(outBuffer size >= (aByteArray size + nextToWrite))
		ifFalse: [self growOutBufferTo: aByteArray size + (nextToWrite - firstByte)].
	outBuffer
		replaceFrom: nextToWrite
		to: nextToWrite + aByteArray size - 1
		with: aByteArray
		startingAt: 1.
	nextToWrite := nextToWrite + aByteArray size.
	self checkAutoFlush
]

{ #category : 'accessing' }
RsrBufferedStream >> stream: aStream [

	stream := aStream
]
