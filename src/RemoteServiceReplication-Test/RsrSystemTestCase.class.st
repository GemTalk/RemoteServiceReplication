Class {
	#name : 'RsrSystemTestCase',
	#superclass : 'RsrTestCase',
	#instVars : [
		'rsrSessionA',
		'rsrSessionB'
	],
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'testing' }
RsrSystemTestCase class >> isAbstract [

	^self == RsrSystemTestCase
]

{ #category : 'expecting' }
RsrSystemTestCase >> expectCatch: aPromise [

	| semaphore wasFulfilled result whenValue |
	semaphore := Semaphore new.
	wasFulfilled := false.
	aPromise
		when: [:value | whenValue := value. wasFulfilled := true. semaphore signal]
		catch: [:reason | result := reason. semaphore signal].
	semaphore wait.
	self deny: wasFulfilled.
	^result
]

{ #category : 'expecting' }
RsrSystemTestCase >> expectWhen: aPromise [

	| semaphore wasBroken result |
	semaphore := Semaphore new.
	wasBroken := false.
	aPromise
		when: [:value | result := value. semaphore signal]
		catch: [:r | wasBroken := true. semaphore signal].
	semaphore wait.
	self deny: wasBroken.
	^result
]

{ #category : 'initialization' }
RsrSystemTestCase >> initializeInMemorySessions [

	self openSessionsFromTemplate: RsrInMemoryTransportTemplate new
]

{ #category : 'initialization' }
RsrSystemTestCase >> initializeSocketSessions [

	self openSessionsFromTemplate: RsrInternalSocketTransportTemplate new
]

{ #category : 'private' }
RsrSystemTestCase >> openSessionsFromTemplate: template [

	| sessionPair |
	sessionPair := RsrTransport openRsrSessionFrom: template.
	rsrSessionA := sessionPair first.
	rsrSessionB := sessionPair second.
	self
		assert: rsrSessionA isOpen;
		assert: rsrSessionB isOpen
]

{ #category : 'accessing' }
RsrSystemTestCase >> peerOf: aService [

	| sessionInPeer |
	sessionInPeer := aService _rsrSession.
	sessionInPeer ifNil: [self assert: false description: 'Unable to obtain the peer of an unregistered Service.'].
	^sessionInPeer == rsrSessionA
		ifTrue: [rsrSessionB serviceAt: aService _id]
		ifFalse: [rsrSessionA serviceAt: aService _id]
]

{ #category : 'initialization' }
RsrSystemTestCase >> setUp [
	"Subclasses need to start their sessions by sending
	#initializeInMemorySessions or #initializeSocketSessions.
	#tearDown will close sessions."

	super setUp
]

{ #category : 'initialization' }
RsrSystemTestCase >> tearDown [

	rsrSessionA ifNotNil: [:sess | sess close].
	rsrSessionB ifNotNil: [:sess | sess close].
	rsrSessionA := rsrSessionB := nil.
	super tearDown
]
