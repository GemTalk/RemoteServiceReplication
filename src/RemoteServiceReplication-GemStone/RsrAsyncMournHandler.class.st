"
+++This class is private and shouldn't be used by any users of RSR+++

In GemStone, Ephemeron interrupts are serviced on the active thread when the interrupt is asserted. This causes a problem in RSR. If we are in a critical section in the service registry, we can end up in a situation where we attempt to re-enter a registry critical section.

A recursive lock isn't a safe choice to resolve this problem. We may be part way through updating the registry data structures when we process a removal sparked by an Ephemeron mourn.

This class gets around this issue by processing Ephemeron mourning on a separate and distict thread from all others in the program. It is possible that another process might already be processing events asynchronously. In that event, we notify the calling code. If they choose to continue using RSR, we abort the handler and allow RSR to continue its setup.
"
Class {
	#name : 'RsrAsyncMournHandler',
	#superclass : 'RsrObject',
	#instVars : [
		'process',
		'notifier',
		'isActive'
	],
	#category : 'RemoteServiceReplication-GemStone'
}

{ #category : 'accessing' }
RsrAsyncMournHandler class >> current [

	^SessionTemps current
		at: #CurrentRsrAsyncEventHandler
		ifAbsentPut: [super new]
]

{ #category : 'instance creation' }
RsrAsyncMournHandler class >> new [

	^RsrError signal: '', self name, ' is a singleton. See #current.'
]

{ #category : 'lifecycle' }
RsrAsyncMournHandler >> ensureStarted [
	"Ensure that the handler is currently active."

	self isActive ifFalse: [self start]
]

{ #category : 'initializing' }
RsrAsyncMournHandler >> initialize [

	super initialize.
	isActive := false
]

{ #category : 'testing' }
RsrAsyncMournHandler >> isActive [

	^isActive
]

{ #category : 'accessing' }
RsrAsyncMournHandler >> process [

	^process
]

{ #category : 'lifecycle' }
RsrAsyncMournHandler >> runLoop [

	[[self isActive]
		whileTrue:
			[[notifier readNotification]
				onException: { GcFinalizeNotification. TransactionBacklog. }
				do: {
					[:ex | ex _finalizeEphemerons].
					[:ex | System abortTransaction].
				}]]
		on: SocketError
		do: [:ex | ex return]
]

{ #category : 'lifecycle' }
RsrAsyncMournHandler >> start [

	[notifier := GsSignalingSocket newForAsyncExceptions: {GcFinalizeNotification. TransactionBacklog. }.
	notifier interrupting: true]
		on: SocketError
		do:
			[:ex |
			RsrNotification signal: 'Async event notifications are already being processed by an external process. Aborting async event processing in RSR.'.
			^self].
	process := RsrProcessModel
		fork:
			[[isActive := true.
			self runLoop]
				ensure:
					[GsSignalingSocket disableAsyncExceptions.
					process := nil.
					notifier := nil.
					isActive := false]]
		at: Processor highIOPriority + 1
		named: 'Ephemeron Mourning Process'
]

{ #category : 'lifecycle' }
RsrAsyncMournHandler >> stop [
	"Stop processing Asynchronous Events"

	self isActive
		ifTrue:
			[GsSignalingSocket disableAsyncExceptions.
			Processor yield]
]
