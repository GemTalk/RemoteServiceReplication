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
RsrSystemTestCase >> initializeInMemoryConnections [

	| spec |
	spec := RsrInMemoryConnectionSpecification new.
	spec connect.
	rsrSessionA := spec connectionA.
	rsrSessionB := spec connectionB.
	self
		assert: rsrSessionA isOpen;
		assert: rsrSessionB isOpen
]

{ #category : 'initialization' }
RsrSystemTestCase >> initializeSocketConnections [

	| spec |
	spec := RsrInternalSocketConnectionSpecification new.
	spec connect.
	rsrSessionA := spec connectionA.
	rsrSessionB := spec connectionB.
	self
		assert: rsrSessionA isOpen;
		assert: rsrSessionB isOpen
]

{ #category : 'accessing' }
RsrSystemTestCase >> peerOf: aService [

	| connectionInPeer |
	connectionInPeer := aService _connection.
	connectionInPeer ifNil: [self assert: false description: 'Unable to obtain the peer of an unregistered Service.'].
	^connectionInPeer == rsrSessionA
		ifTrue: [rsrSessionB serviceAt: aService _id]
		ifFalse: [rsrSessionA serviceAt: aService _id]
]

{ #category : 'initialization' }
RsrSystemTestCase >> setUp [
	"Subclasses need to start their connections by calling
	#initializeInMemoryConnections or #initializeSocketConnections.
	#tearDown will close connections."

	super setUp
]

{ #category : 'initialization' }
RsrSystemTestCase >> tearDown [

	rsrSessionA ifNotNil: [:conn | conn close].
	rsrSessionB ifNotNil: [:conn | conn close].
	rsrSessionA := rsrSessionB := nil.
	super tearDown
]
