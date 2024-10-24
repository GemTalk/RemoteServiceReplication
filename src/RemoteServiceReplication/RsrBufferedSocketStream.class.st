Class {
	#name : 'RsrBufferedSocketStream',
	#superclass : 'RsrObject',
	#instVars : [
		'stream',
		'outBuffer',
		'writePosition',
		'nextToWrite'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrBufferedSocketStream class >> on: aSocketStream [

	^self new
		stream: aSocketStream;
		yourself
]

{ #category : 'writing' }
RsrBufferedSocketStream >> atEnd [

	^stream atEnd
]

{ #category : 'writing' }
RsrBufferedSocketStream >> checkAutoFlush [

	nextToWrite > 4096
		ifTrue: [ self flush ]
]

{ #category : 'writing' }
RsrBufferedSocketStream >> close [

	stream close
]

{ #category : 'writing' }
RsrBufferedSocketStream >> flush [

	writePosition = nextToWrite
		ifTrue: [^self].
	stream nextPutAll: (outBuffer copyFrom: writePosition to: nextToWrite - 1).
	writePosition := nextToWrite := 1.
	stream flush
]

{ #category : 'writing' }
RsrBufferedSocketStream >> growOutBufferTo: aNumberOfBytes [

	| rounding |
	rounding := ((aNumberOfBytes \\ 4096) + 1) * 4096.
	outBuffer := outBuffer , (ByteArray new: rounding - outBuffer size)
]

{ #category : 'initialization' }
RsrBufferedSocketStream >> initialize [

	super initialize.
	outBuffer := ByteArray new: 4096.
	nextToWrite := 1.
	writePosition := 1
]

{ #category : 'writing' }
RsrBufferedSocketStream >> isConnected [

	^stream isConnected
]

{ #category : 'writing' }
RsrBufferedSocketStream >> next [

	^self next: 1
]

{ #category : 'writing' }
RsrBufferedSocketStream >> next: aCount [

	^stream next: aCount
]

{ #category : 'writing' }
RsrBufferedSocketStream >> nextPutAll: aByteArray [

	(outBuffer size >= (aByteArray size + nextToWrite))
		ifFalse: [self growOutBufferTo: outBuffer size + nextToWrite].
	outBuffer
		replaceFrom: nextToWrite
		to: nextToWrite + aByteArray size - 1
		with: aByteArray
		startingAt: 1.
	nextToWrite := nextToWrite + aByteArray size.
	self checkAutoFlush
]

{ #category : 'accessing' }
RsrBufferedSocketStream >> stream: aStream [

	stream := aStream
]
