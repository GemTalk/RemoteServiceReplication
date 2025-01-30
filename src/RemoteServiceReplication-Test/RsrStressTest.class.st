Class {
	#name : 'RsrStressTest',
	#superclass : 'RsrSystemTestCase',
	#instVars : [
		'client',
		'server'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrStressTest class >> defaultTimeLimit [

	^Duration seconds: 30
]

{ #category : 'testing' }
RsrStressTest class >> isAbstract [

	^self == RsrStressTest
]

{ #category : 'initialize/release' }
RsrStressTest >> cleanupServices [

	client := server := nil
]

{ #category : 'accessing' }
RsrStressTest >> client [

	^client
]

{ #category : 'running-utilities' }
RsrStressTest >> concurrentlyRun: aBlock [

	| anyCurtailed semaphores |
	anyCurtailed := false.
	semaphores := (1 to: self numThreads) collect: [:each | Semaphore new].
	semaphores do: [:semaphore | RsrProcessModel fork: [[self repeatedlyRun: aBlock. semaphore signal] ifCurtailed: [anyCurtailed := true. semaphore signal]] named: 'Concurrent Test Thread'].
	semaphores do: [:semaphore | semaphore wait].
	self deny: anyCurtailed
]

{ #category : 'accessing' }
RsrStressTest >> defaultTestDuration [

	^self class defaultTimeLimit / 2
]

{ #category : 'initialize/release' }
RsrStressTest >> initializeServices [

	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	server action: [:x | x]
]

{ #category : 'accessing' }
RsrStressTest >> numThreads [

	^15
]

{ #category : 'running-utilities' }
RsrStressTest >> repeatedlyRun: aBlock [

	| endTime |
	endTime := DateAndTime now + self defaultTestDuration.
	self
		repeatedlyRun: aBlock
		until: endTime
]

{ #category : 'running-utilities' }
RsrStressTest >> repeatedlyRun: aBlock
until: endTime [

	[DateAndTime now < endTime]
		whileTrue: [aBlock value]
]

{ #category : 'running-utilities' }
RsrStressTest >> repeatedlySend: anObject [

	self repeatedlyRun: [self send: anObject]
]

{ #category : 'running-utilities' }
RsrStressTest >> send: anObject [

	self client value: anObject
]

{ #category : 'accessing' }
RsrStressTest >> server [

	^server
]

{ #category : 'initialize/release' }
RsrStressTest >> setUp [

	super setUp.
	self
		initializeConnections;
		initializeServices
]

{ #category : 'initialize/release' }
RsrStressTest >> tearDown [

	self cleanupServices.
	super tearDown
]

{ #category : 'running' }
RsrStressTest >> test10MBytes [

	self repeatedlySend: (ByteArray new: 1024 * 1024 * 10)
]

{ #category : 'running' }
RsrStressTest >> test1KBytes [

	self repeatedlySend: (ByteArray new: 1024)
]

{ #category : 'running' }
RsrStressTest >> test1MBytes [

	self repeatedlySend: (ByteArray new: 1024 squared)
]

{ #category : 'running' }
RsrStressTest >> test2KBytes [

	self repeatedlySend: (ByteArray new: 1024 *2)
]

{ #category : 'running' }
RsrStressTest >> testBasicSends [

	self repeatedlySend: nil
]

{ #category : 'running' }
RsrStressTest >> testConcurrent1KBytes [

	self concurrentlyRun: [self client value: (ByteArray new: 1024)]
]

{ #category : 'running' }
RsrStressTest >> testConcurrent2KBytes [

	self concurrentlyRun: [self client value: (ByteArray new: 2 * 1024)]
]

{ #category : 'running' }
RsrStressTest >> testConcurrentBasicSends [

	self concurrentlyRun: [self client value: nil]
]
