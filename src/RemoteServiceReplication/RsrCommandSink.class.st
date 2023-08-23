Class {
	#name : 'RsrCommandSink',
	#superclass : 'RsrStreamChannelLoop',
	#instVars : [
		'queue'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrCommandSink >> addCommunicationProcessesTo: aSet [
	"Add all processes used for Communication to the provided set."
	
	aSet add: process
]

{ #category : 'accessing' }
RsrCommandSink >> encoder [

	^RsrCommandEncoder new
]

{ #category : 'commands' }
RsrCommandSink >> enqueue: aCommand [

	self isActive ifTrue: [queue nextPut: aCommand]
]

{ #category : 'commands' }
RsrCommandSink >> executeCycle [

	[| command |
	command := queue next.
	command == self stopToken
		ifTrue: [^self].
	self writeCommand: command.
	(queue size = 0) "Dolphin does not support #isEmpty"
		ifTrue: [self flush]]
		on: RsrSocketClosed
		do:
			[:ex |
			self reportException: ex.
			self channel disconnected]
]

{ #category : 'commands' }
RsrCommandSink >> flush [

	stream flush
]

{ #category : 'initialization' }
RsrCommandSink >> initialize [

	super initialize.
	queue := SharedQueue new
]

{ #category : 'accessing' }
RsrCommandSink >> runLoopName [

	^'Channel Writing'
]

{ #category : 'commands' }
RsrCommandSink >> stop [

	super stop.
	queue nextPut: self stopToken
]

{ #category : 'accessing' }
RsrCommandSink >> stopToken [

	^self stoppedState
]

{ #category : 'writing' }
RsrCommandSink >> write: aByteArray [

	stream nextPutAll: aByteArray
]

{ #category : 'writing' }
RsrCommandSink >> writeCommand: aCommand [

	| bytes |
	self report: aCommand.
	bytes := ByteArray
		streamContents:
			[:stream |
			aCommand
				encode: stream
				using: self encoder].
	self write: bytes
]
