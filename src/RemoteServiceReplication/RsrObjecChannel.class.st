Class {
	#name : 'RsrObjecChannel',
	#superclass : 'RsrObsoleteChannel',
	#instVars : [
		'inQueue',
		'outQueue',
		'drainProcess'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrObjecChannel class >> inQueue: inQueue
outQueue: outQueue [

	^self new
		inQueue: inQueue;
		outQueue: outQueue;
		yourself
]

{ #category : 'accessing' }
RsrObjecChannel >> addCommunicationProcessesTo: aSet [
	"Add all processes used for Communication to the provided set."
	
	aSet add: drainProcess 
]

{ #category : 'lifecycle' }
RsrObjecChannel >> close [

	outQueue nextPut: nil.
	inQueue nextPut: nil
]

{ #category : 'processing' }
RsrObjecChannel >> drainLoop [

	| command |
	[command := inQueue next.
	command isNil]
		whileFalse:
			[self received: command].
	self rsrSession channelDisconnected
]

{ #category : 'accessing' }
RsrObjecChannel >> inQueue [

	^inQueue
]

{ #category : 'accessing' }
RsrObjecChannel >> inQueue: aSharedQueue [

	inQueue := aSharedQueue
]

{ #category : 'testing' }
RsrObjecChannel >> isConnected [

	^drainProcess isNil not
]

{ #category : 'lifecycle' }
RsrObjecChannel >> open [

	drainProcess := RsrProcessModel
		fork:
			[RsrProcessModel configureCommunicationsProcess.
			self drainLoop.
			drainProcess := nil]
		named: 'InMemoryChannel Receiving'
]

{ #category : 'accessing' }
RsrObjecChannel >> outQueue [

	^outQueue
]

{ #category : 'accessing' }
RsrObjecChannel >> outQueue: aSharedQueue [

	outQueue := aSharedQueue
]

{ #category : 'lifecycle' }
RsrObjecChannel >> send: aCommand [

	outQueue nextPut: aCommand
]
