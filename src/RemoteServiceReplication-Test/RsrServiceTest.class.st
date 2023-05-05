Class {
	#name : 'RsrServiceTest',
	#superclass : 'RsrSystemTestCase',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'testing' }
RsrServiceTest class >> isAbstract [

	^self == RsrServiceTest
]

{ #category : 'running-utilities' }
RsrServiceTest >> mirror: aService [

	| client |
	client := RsrClientNoInstVars new
		registerWith: rsrSessionA;
		yourself.
	^client sendReturnArgument: aService
]

{ #category : 'running' }
RsrServiceTest >> testAnalyzeServiceRegisteredWithDifferentConnection [

	| instance analysis |
	instance := RsrRemoteAction clientClass new.
	analysis := RsrSnapshotAnalysis
		roots: (Array with: instance)
		connection: rsrSessionA.
	analysis perform.
	self assert: instance isMirrored.
	analysis := RsrSnapshotAnalysis
		roots: (Array with: instance)
		connection: rsrSessionB.
	self
		should: [analysis perform]
		raise: RsrAlreadyRegistered
]

{ #category : 'running' }
RsrServiceTest >> testEnsureServersAreCachedAndReused [

	| client service1 service2 |
	client := RsrRemoteActionClient new
		registerWith: rsrSessionA;
		synchronize.
	service1 := rsrSessionB serviceAt: client _id.
	self mirror: client.
	service2 := rsrSessionB serviceAt: client _id.
	self
		assert: service1
		identicalTo: service2
]

{ #category : 'running' }
RsrServiceTest >> testHasRemoteSelf [

	| service |
	service := RsrTestService clientClass new.
	self mirror: service.
	self deny: nil == service remoteSelf
]

{ #category : 'running' }
RsrServiceTest >> testInitialization [

	| instance |
	instance := RsrRemoteAction clientClass new.
	self
		assert: instance isMirrored
		equals: false.
	self
		assert: instance _id
		equals: nil.
	self
		assert: instance _connection
		equals: nil
]

{ #category : 'running' }
RsrServiceTest >> testIsMirrored [

	| instance |
	instance := RsrRemoteAction clientClass new.
	self deny: instance isMirrored.
	self mirror: instance.
	self assert: instance isMirrored
]

{ #category : 'running' }
RsrServiceTest >> testMessageDispatchedConcurrentlyToSingleService [
	"Ensure all messages are sent concurrently (including those sent to a single service)"

	| client server counter promise1 promise2 |
	client := RsrRemoteActionClient new
		registerWith: rsrSessionA;
		synchronize.
	server := rsrSessionB serviceAt: client _id.
	counter := 0.
	server action: [counter := counter + 1. self shortWait. counter].
	promise1 := client asyncValue.
	promise2 := client asyncValue.
	self
		assert: promise1 wait
		equals: 2. "The #shortWait will cause the second counter increment before the counter is returned."
	self
		assert: promise2 wait
		equals: 2
]

{ #category : 'running' }
RsrServiceTest >> testMessagesDispactchedConcurrentlyForMultipleServices [
	"Ensure messages are dispatched concurrently"

	| client1 server1 client2 server2 semaphore expected1 expected2 promise1 promise2 |
	client1 := RsrRemoteActionClient new
		registerWith: rsrSessionA;
		synchronize.
	client2 := RsrRemoteActionClient new
		registerWith: rsrSessionA;
		synchronize.
	server1 := rsrSessionB serviceAt: client1 _id.
	server2 := rsrSessionB serviceAt: client2 _id.
	semaphore := Semaphore new.
	expected1 := #expected1.
	expected2 := #expected2.
	server1 action: [semaphore wait. expected1].
	server2 action: [semaphore signal. expected2].
	promise1 := client1 asyncValue.
	promise2 := client2 asyncValue.
	self shortWait.
	self
		assert: promise1 isResolved;
		assert: promise2 isResolved.
	self
		assert: promise1 value
		equals: expected1.
	self
		assert: promise2 value
		equals: expected2
]

{ #category : 'running' }
RsrServiceTest >> testPostRegistration [

	| client  server testClient testServer regCount |
	"#registerWith: validation"
	client := RsrInstrumentedClient new.
	self
		assert: client postRegistrationCount
		equals: 0.
	client registerWith: rsrSessionA.
	self
		assert: client postRegistrationCount
		equals: 1.
	client registerWith: rsrSessionA.
	self
		assert: client postRegistrationCount
		equals: 1.
	client synchronize.
	server := self peerOf: client.
	self
		assert: client postRegistrationCount
		equals: 1.
	self
		assert: server postRegistrationCount
		equals: 0.

	"Validate implicit registration of argument Service"
	testClient := RsrInstrumentedClient new.
	server action: [:testServerArg | testServerArg postRegistrationCount].
	regCount := client value: testClient.
	self
		assert: regCount
		equals: 0.
	self
		assert: testClient postRegistrationCount
		equals: 1.
	testServer := self peerOf: testClient.
	self
		assert: testServer postRegistrationCount
		equals: 0.

	"Validate implicit registration of returned Services"
	testClient := testServer := nil.
	server action: [testServer := RsrInstrumentedServer new].
	testClient := client value.
	self
		assert: testClient postRegistrationCount
		equals: 0.
	self
		assert: testServer postRegistrationCount
		equals: 1
]

{ #category : 'running' }
RsrServiceTest >> testPostRegistrationRaisesException [

	| client server reason tag badService signaledException caughtException |
	"Return values"
	client := RsrRemoteActionClient new
		registerWith: rsrSessionA;
		synchronize.
	server := self peerOf: client.
	tag := DateAndTime now asString.
	server action: [RsrRemoteActionServer new postRegistrationHandler: [Error new tag: tag; signal]; yourself].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason exceptionClassName
		equals: #Error.
	self
		assert: reason tag
		equals: tag. "This string came through RSR. It is equivalent but not identical."

	"Message sends"
	signaledException := Error new.
	badService := RsrRemoteActionServer new
		postRegistrationHandler: [signaledException signal];
		yourself.
	caughtException := [client value: badService]
		on: Error
		do: [:ex | ex return: ex].
	self
		assert: signaledException
		identicalTo: caughtException "RSR did not alter this exception. It should be identical."
]

{ #category : 'running' }
RsrServiceTest >> testPrePostUpdate [

	| client server | 
	client := RsrInstrumentedClient new
		registerWith: rsrSessionA;
		yourself.
	self
		assert: client preUpdateCount
		equals: 0.
	self
		assert: client postUpdateCount
		equals: 0.
	client return: nil.
	server := rsrSessionB serviceAt: client _id.
	self
		assert: client preUpdateCount
		equals: 1.
	self
		assert: client postUpdateCount
		equals: 1.
	self
		assert: server preUpdateCount
		equals: 1.
	self
		assert: server postUpdateCount
		equals: 1.
	client return: nil.
	self
		assert: client preUpdateCount
		equals: 2.
	self
		assert: client postUpdateCount
		equals: 2.
	self
		assert: server preUpdateCount
		equals: 2.
	self
		assert: server postUpdateCount
		equals: 2.
]

{ #category : 'running' }
RsrServiceTest >> testReflectedVariableNames [

	| client server clientNames serverNames |
	client := RsrClientTestService new
		registerWith: rsrSessionA;
		synchronize.
	server := rsrSessionB serviceAt: client _id.
	clientNames := RsrServiceSnapshot reflectedVariablesFor: client.
	serverNames := RsrServiceSnapshot reflectedVariablesFor: server.
	self
		assert: clientNames
		equals: serverNames.
	self
		assert: clientNames size
		equals: 1.
	self
		assert: (clientNames at: 1) asSymbol
		equals: #sharedVariable.
	client := RsrReflectedVariableTestClient new
		registerWith: rsrSessionA;
		synchronize.
	server := rsrSessionB serviceAt: client _id.
	clientNames := RsrServiceSnapshot reflectedVariablesFor: client.
	serverNames := RsrServiceSnapshot reflectedVariablesFor: server.
	self
		assert: clientNames
		equals: serverNames.
	self
		assert: clientNames size
		equals: 2.
	self
		assert: (clientNames at: 1) asSymbol
		equals: #varA.
	self
		assert: (clientNames at: 2) asSymbol
		equals: #varB
]

{ #category : 'running' }
RsrServiceTest >> testRegisterWith [

	| instance |
	instance := RsrRemoteAction clientClass new.
	self deny: instance isMirrored.
	instance registerWith: rsrSessionA.
	self assert: instance isMirrored.
	self
		should: [instance registerWith: rsrSessionB]
		raise: RsrAlreadyRegistered
]

{ #category : 'running' }
RsrServiceTest >> testReturnServerWithoutAssociatedClient [

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: rsrSessionA;
		synchronize.
	server := rsrSessionB serviceAt: client _id.
	server action: [RsrKnownServer new].
	reason := self expectCatch: client asyncValue.
	self
		assert: reason class
		equals: RsrDecodingRaisedException
]

{ #category : 'running' }
RsrServiceTest >> testSendClientWithoutAssociatedServer [

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: rsrSessionA;
		synchronize.
	server := rsrSessionB serviceAt: client _id.
	server action: [:x | x].
	reason := self expectCatch: (client asyncValue: RsrKnownClient new).
	self
		assert: reason class
		equals: RsrRemoteExceptionServer.
	self
		assert: reason exceptionClassName
		equals: #RsrUnknownClass
]

{ #category : 'running' }
RsrServiceTest >> testVariableReflection [

	| localService remoteService |
	localService := RsrTestService clientClass new
		sharedVariable: #shared;
		privateVariable: #private;
		yourself.
	self mirror: localService.
	remoteService := rsrSessionB serviceAt: localService _id.
	self
		assert: localService sharedVariable
		identicalTo: remoteService sharedVariable.
	self
		assert: localService privateVariable
		identicalTo: #private.
	self
		assert: remoteService privateVariable
		identicalTo: nil
]
