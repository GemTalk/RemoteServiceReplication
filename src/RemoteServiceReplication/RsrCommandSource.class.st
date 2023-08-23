Class {
	#name : 'RsrCommandSource',
	#superclass : 'RsrStreamChannelLoop',
	#instVars : [
		'decoder'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrCommandSource >> addCommunicationProcessesTo: aSet [
	"Add all processes used for Communication to the provided set."
	
	aSet add: process
]

{ #category : 'accessing' }
RsrCommandSource >> decoder [

	^RsrCommandDecoder new
]

{ #category : 'commands' }
RsrCommandSource >> executeCycle [

	[| command |
	command := self nextCommand.
	self report: command.
	self channel received: command]
		on: RsrSocketClosed
		do:
			[:ex |
			self reportException: ex.
			self channel disconnected]
]

{ #category : 'commands' }
RsrCommandSource >> nextCommand [

	^self decoder decodeCommand: stream
]

{ #category : 'accessing' }
RsrCommandSource >> runLoopName [

	^'Channel Reading'
]
