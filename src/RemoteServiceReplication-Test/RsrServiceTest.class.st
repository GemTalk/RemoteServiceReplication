Class {
	#name : 'RsrServiceTest',
	#superclass : 'RsrSystemTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'testing' }
RsrServiceTest class >> isAbstract [

	^self == RsrServiceTest
]

{ #category : 'running-utilities' }
RsrServiceTest >> mirror: aService [

	| client |
	client := RsrClientNoInstVars new
		registerWith: connectionA;
		yourself.
	^client sendReturnArgument: aService
]

{ #category : 'running' }
RsrServiceTest >> testAnalyzeServiceRegisteredWithDifferentConnection [

	| instance analysis |
	instance := RsrRemoteActionClient new.
	analysis := RsrSnapshotAnalysis
		roots: (Array with: instance)
		connection: connectionA.
	analysis perform.
	self assert: instance isMirrored.
	analysis := RsrSnapshotAnalysis
		roots: (Array with: instance)
		connection: connectionB.
	self
		should: [analysis perform]
		raise: RsrAlreadyRegisteredWithAnotherConnection
]

{ #category : 'running' }
RsrServiceTest >> testCustomTemplateResolver [

	| serviceClass templateClass replicatedService testResolver newService |
	"Replicate a service initially to verify it continues to function."
	serviceClass := RsrRemoteActionClient.
	templateClass := RsrRemoteAction.
	replicatedService := serviceClass new.
	replicatedService
		registerWith: connectionA;
		synchronize.
	self
		assert: (connectionB serviceAt: replicatedService _id) class
		equals: RsrRemoteActionServer.

	"Set the template resolver to a test resolver which cannot resolve any templates initially."
	testResolver := RsrTestTemplateResolver new.
	connectionB templateResolver: testResolver.
	self "Ensure that the existing service continues to function."
		shouldnt: [replicatedService synchronize]
		raise: RsrBrokenPromise.
	newService := serviceClass new.
	newService registerWith: connectionA.
	self
		should: [newService synchronize]
		raise: RsrBrokenPromise.
	
	"Add the template to the resolver. The service should now replicate successfully."
	testResolver addTemplate: templateClass.
	self
		shouldnt: [newService synchronize]
		raise: RsrBrokenPromise.
]

{ #category : 'running' }
RsrServiceTest >> testEnsureServersAreCachedAndReused [

	| client service1 service2 |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	service1 := connectionB serviceAt: client _id.
	self mirror: client.
	service2 := connectionB serviceAt: client _id.
	self
		assert: service1
		identicalTo: service2
]

{ #category : 'running' }
RsrServiceTest >> testHasRemoteSelf [

	| service |
	service := RsrClientTestService new.
	self mirror: service.
	self deny: nil == service remoteSelf
]

{ #category : 'running' }
RsrServiceTest >> testInitialization [

	| instance |
	instance := RsrRemoteActionClient new.
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
	instance := RsrRemoteActionClient new.
	self deny: instance isMirrored.
	self mirror: instance.
	self assert: instance isMirrored
]

{ #category : 'running' }
RsrServiceTest >> testMessageDispatchedConcurrentlyToSingleService [
	"Ensure all messages are sent concurrently (including those sent to a single service)"

	| client server counter promise1 promise2 |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
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
		registerWith: connectionA;
		synchronize.
	client2 := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server1 := connectionB serviceAt: client1 _id.
	server2 := connectionB serviceAt: client2 _id.
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
	client registerWith: connectionA.
	self
		assert: client postRegistrationCount
		equals: 1.
	client registerWith: connectionA.
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
		registerWith: connectionA;
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
		registerWith: connectionA;
		yourself.
	self
		assert: client preUpdateCount
		equals: 0.
	self
		assert: client postUpdateCount
		equals: 0.
	client return: nil.
	server := connectionB serviceAt: client _id.
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

	| client server expectedNames clientNames serverNames |
	client := RsrTestTemplateClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	expectedNames := #(#abstractTemplateVariable #templateVariable) asOrderedCollection.
	clientNames := RsrServiceSnapshot reflectedVariablesFor: client.
	serverNames := RsrServiceSnapshot reflectedVariablesFor: server.
	self
		assert: clientNames
		equals: expectedNames.
	self
		assert: serverNames
		equals: expectedNames.
	client := RsrReflectedVariableTestClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
	expectedNames := #( #varA #varB ) asOrderedCollection.
	clientNames := RsrServiceSnapshot reflectedVariablesFor: client.
	serverNames := RsrServiceSnapshot reflectedVariablesFor: server.
	self
		assert: clientNames
		equals: expectedNames.
	self
		assert: serverNames
		equals: expectedNames
]

{ #category : 'running' }
RsrServiceTest >> testRegisterWith [

	| instance |
	instance := RsrRemoteActionClient new.
	self deny: instance isMirrored.
	instance registerWith: connectionA.
	self assert: instance isMirrored.
	self
		should: [instance registerWith: connectionB]
		raise: RsrAlreadyRegisteredWithAnotherConnection
]

{ #category : 'running' }
RsrServiceTest >> testReturnServerWithoutAssociatedClient [

	| client server reason |
	client := RsrRemoteActionClient new
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
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
		registerWith: connectionA;
		synchronize.
	server := connectionB serviceAt: client _id.
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
	localService := RsrClientTestService new
		sharedVariable: #shared;
		privateVariable: #private;
		yourself.
	self mirror: localService.
	remoteService := connectionB serviceAt: localService _id.
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
