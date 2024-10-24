Class {
	#name : 'RsrLog',
	#superclass : 'RsrObject',
	#instVars : [
		'verbosity',
		'sinks'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'configuring' }
RsrLog >> addSink: aLogSink [

	sinks add: aLogSink
]

{ #category : 'logging' }
RsrLog >> critical: aString [

	self verbosity >= self levelCritical
		ifTrue: [self log: aString level: #critical]
]

{ #category : 'logging' }
RsrLog >> debug: aString [

	self verbosity >= self levelDebug
		ifTrue: [	self log: aString level: #debug]
]

{ #category : 'logging' }
RsrLog >> error: aString [

	self verbosity >= self levelError
		ifTrue: [self log: aString level: #error]
]

{ #category : 'logging' }
RsrLog >> info: aString [

	self verbosity >= self levelInfo
		ifTrue: [self log: aString level: #info]
]

{ #category : 'initialization' }
RsrLog >> initialize [

	super initialize.
	verbosity := self levelTrace.
	sinks := OrderedCollection new
]

{ #category : 'accessing' }
RsrLog >> levelCritical [

	^0
]

{ #category : 'accessing' }
RsrLog >> levelDebug [

	^4
]

{ #category : 'accessing' }
RsrLog >> levelError [

	^1
]

{ #category : 'accessing' }
RsrLog >> levelInfo [

	^3
]

{ #category : 'accessing' }
RsrLog >> levelTrace [

	^5
]

{ #category : 'accessing' }
RsrLog >> levelWarn [

	^2
]

{ #category : 'logging' }
RsrLog >> log: aMessage
level: aLevelString [

	| message |
	message := RsrDateAndTime now printString, '-', aLevelString, '-', aMessage.
	sinks do: [:each | each write: message]
]

{ #category : 'logging' }
RsrLog >> trace: aString [

	self verbosity >= self levelTrace
		ifTrue: [self log: aString level: #trace]
]

{ #category : 'accessing' }
RsrLog >> verbosity [

	^verbosity
]

{ #category : 'accessing' }
RsrLog >> verbosity: aLogLevel [

	verbosity := aLogLevel
]

{ #category : 'logging' }
RsrLog >> warning: aString [

	self verbosity >= self levelWarn
		ifTrue: [self log: aString level: #warning]
]
