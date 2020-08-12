"
I maintain the associations between locally stored objects and their remote counterparts.
"
Class {
	#name : 'RsrRegistry',
	#superclass : 'RsrObject',
	#instVars : [
		'mutex',
		'map',
		'reapAction',
		'reaper'
	],
	#category : 'RemoteServiceReplication-Pharo'
}

{ #category : 'instance creation' }
RsrRegistry class >> new [

	^self reapAction: [:key |]
]

{ #category : 'instance creation' }
RsrRegistry class >> reapAction: aBlock [

	^super new
		reapAction: aBlock;
		yourself
]

{ #category : 'initialization' }
RsrRegistry >> at: aKey
put: anEntry [
	"Store aService into the registry"

	(anEntry isKindOf: RsrService)
		ifTrue: [^self error].
	mutex critical: [map at: aKey put: anEntry]
]

{ #category : 'reaping' }
RsrRegistry >> cleanupEntryFor: aKey [

	self removeKey: aKey.
]

{ #category : 'initialization' }
RsrRegistry >> dispatcherAt: aKey [

	^self
		dispatcherAt: aKey
		ifAbsent: [KeyNotFound signal: aKey asString]
]

{ #category : 'initialization' }
RsrRegistry >> dispatcherAt: aKey
ifAbsent: aBlock [

	| element |
	element := mutex critical: [map at: aKey ifAbsent: []].
	^element
		ifNil: aBlock
		ifNotNil: [element dispatcher]
]

{ #category : 'initialization' }
RsrRegistry >> includesKey: aKey [

	^mutex critical: [map includesKey: aKey]
]

{ #category : 'initialization' }
RsrRegistry >> initialize [

	super initialize.
	map := Dictionary new.
	mutex := Semaphore forMutualExclusion.
	reaper := RsrServiceReaper for: self
]

{ #category : 'accessing' }
RsrRegistry >> reapAction [

	^reapAction
]

{ #category : 'accessing' }
RsrRegistry >> reapAction: aBlock [

	reapAction := aBlock
]

{ #category : 'reaping' }
RsrRegistry >> reapClient: aKey [
	
	self cleanupEntryFor: aKey.
	self reapAction value: aKey
]

{ #category : 'reaping' }
RsrRegistry >> reapServer: aKey [
	
	self cleanupEntryFor: aKey
]

{ #category : 'accessing' }
RsrRegistry >> reaper [

	^reaper
]

{ #category : 'adding/removing' }
RsrRegistry >> removeKey: aKey [

	| entry |
	entry := mutex critical: [map removeKey: aKey ifAbsent: [nil]].
	^entry
]

{ #category : 'initialization' }
RsrRegistry >> serviceAt: aKey [

	^self
		serviceAt: aKey
		ifAbsent: [KeyNotFound signal: aKey asString]
]

{ #category : 'initialization' }
RsrRegistry >> serviceAt: aKey
ifAbsent: aBlock [

	| element |
	element := mutex critical: [map at: aKey ifAbsent: []].
	^element
		ifNil: aBlock
		ifNotNil: [element service]
]

{ #category : 'initialization' }
RsrRegistry >> serviceAt: aKey
put: aService [
	"Store aService into the registry"

	| reapSelector entry |
	reapSelector := aService isServer
		ifTrue: [#reapServer:]
		ifFalse: [#reapClient:].
	entry := RsrRegistryEntry service: aService.
	aService
				toFinalizeSend: reapSelector
				to: self reaper
				with: aKey.
	aService isServer ifTrue: [entry becomeStrong].
	self
		at: aKey
		put: entry
]