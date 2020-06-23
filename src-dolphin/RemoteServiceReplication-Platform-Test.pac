| package |
package := Package name: 'RemoteServiceReplication-Platform-Test'.
package paxVersion: 1; basicComment: ''.

package classNames
	add: #RsrMockServer;
	add: #RsrTestCase;
	add: #RsrSocketTestCase;
	add: #RsrSocketPair;
	add: #RsrClassResolverTestCase;
	add: #RsrMockService;
	add: #RsrTestingProcessModelTestCase;
	add: #RsrTestingProcessModel;
	add: #RsrGarbageCollectorTestCase;
	add: #RsrMockClient;
	yourself.

package methodNames
	yourself.

package setPrerequisites: #('RemoteServiceReplication').

package!

RsrObject
	subclass: #RsrSocketPair
	instanceVariableNames: 'firstSocket secondSocket'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrSocketPair categoriesForClass!RemoteServiceReplication-Platform-Test! !

RsrProcessModel
	subclass: #RsrTestingProcessModel
	instanceVariableNames: 'forkedException'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTestingProcessModel categoriesForClass!RemoteServiceReplication-Platform-Test! !

RsrService
	subclass: #RsrMockService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMockService categoriesForClass!RemoteServiceReplication-Platform-Test! !

TestCase
	subclass: #RsrTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrTestCase comment: 'An abstract test class which contains utility methods'!
!RsrTestCase categoriesForClass!RemoteServiceReplication-Platform-Test! !

RsrTestCase
	subclass: #RsrClassResolverTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrClassResolverTestCase comment: 'This class contains tests'!
!RsrClassResolverTestCase categoriesForClass!RemoteServiceReplication-Platform-Test! !

RsrTestCase
	subclass: #RsrGarbageCollectorTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrGarbageCollectorTestCase comment: 'This class contains tests'!
!RsrGarbageCollectorTestCase categoriesForClass!RemoteServiceReplication-Platform-Test! !

RsrMockService
	subclass: #RsrMockClient
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMockClient categoriesForClass!RemoteServiceReplication-Platform-Test! !

RsrMockService
	subclass: #RsrMockServer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMockServer categoriesForClass!RemoteServiceReplication-Platform-Test! !

RsrTestCase
	subclass: #RsrSocketTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrSocketTestCase comment: 'This class contains tests'!
!RsrSocketTestCase categoriesForClass!RemoteServiceReplication-Platform-Test! !

RsrTestCase
	subclass: #RsrTestingProcessModelTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrTestingProcessModelTestCase comment: 'This class contains tests'!
!RsrTestingProcessModelTestCase categoriesForClass!RemoteServiceReplication-Platform-Test! !

!RsrMockService class methodsFor!
clientClassName	^#RsrMockClient! !

!RsrMockService class methodsFor!
serverClassName	^#RsrMockServer! !

!RsrSocketPair class methodsFor!
firstSocket: firstSocketsecondSocket: secondSocket	^super new		firstSocket: firstSocket;		secondSocket: secondSocket;		yourself! !

!RsrSocketPair class methodsFor!
new	| listener firstSocket secondSocket |	listener := RsrSocket new.	secondSocket := RsrSocket new.	listener listenOn: self listenPort.	secondSocket		connectToHost: '127.0.0.1'		port: self listenPort.	firstSocket := listener accept.	listener close.	(firstSocket isConnected and: [secondSocket isConnected])		ifFalse: [self error: 'Failed to create socket pair'].	^self		firstSocket: firstSocket		secondSocket: secondSocket! !

!RsrSocketPair class methodsFor!
timeout	^2! !

!RsrSocketPair class methodsFor!
listenPort	^64455! !

!RsrTestCase class methodsFor!
isAbstract	^self == RsrTestCase! !

!RsrTestingProcessModel methodsFor!
forkedException	^forkedException! !

!RsrTestingProcessModel methodsFor!
protect: aBlock	^[aBlock on: Exception do: [:ex | forkedException := ex copy. ex return]]! !

!RsrTestingProcessModel methodsFor!
fork: aBlockat: aPriority	^super		fork: (self protect: aBlock)		at: aPriority! !

!RsrTestingProcessModel methodsFor!
fork: aBlock	^super fork: (self protect: aBlock)! !

!RsrSocketTestCase methodsFor!
randomPort	^50123! !

!RsrSocketTestCase methodsFor!
assertWriting: bytesto: writingSocketisReadableOn: readSocket	| readBytes |	writingSocket write: bytes.	readBytes := readSocket read: bytes size.	self		assert: readBytes		equals: bytes! !

!RsrSocketTestCase methodsFor!
testReadAvailable	| pair a b bytes readBytes writingProcess |	pair := RsrSocketPair new.	a := pair firstSocket.	b := pair secondSocket.	bytes := #[1].	self deny: a dataAvailable.	self		assert: a readAvailable		equals: #[].	b write: bytes.	self		assert: a readAvailable		equals: bytes.	self deny: a dataAvailable.	bytes := ByteArray withAll: (1 to: 255).	b write: bytes.	self		assert: a readAvailable		equals: bytes! !

!RsrSocketTestCase methodsFor!
testConnectLocalSockets	| listener server client port |	listener := RsrSocket new.	client := RsrSocket new.	port := self randomPort.	listener listenOn: port.	client		connectToHost: '127.0.0.1'		port: port.	server := listener accept.	listener close.	self		assert: server isConnected;		assert: client isConnected.	self		assertWriting: #(1 2 3 4 5 6 7 8 9 0) asByteArray		to: server		isReadableOn: client.	self		assertWriting: #(0 9 8 7 6 5 4 3 2 1) asByteArray		to: client		isReadableOn: server! !

!RsrSocketTestCase methodsFor!
testHasDataAvailable	| socketPair |	socketPair := RsrSocketPair new.	self deny: socketPair firstSocket dataAvailable.	socketPair secondSocket write: #[1].	self assert: socketPair firstSocket dataAvailable.! !

!RsrSocketTestCase methodsFor!
testConnectToClosedPort	| socket |	socket := RsrSocket new.	self		should: [socket connectToHost: '127.0.0.1' port: 64752]		raise: Error! !

!RsrTestingProcessModelTestCase methodsFor!
testCurrentStackDump	| stack |	stack := RsrProcessModel currentStackDump.	self		assert: stack isString;		assert: stack size > 0! !

!RsrTestingProcessModelTestCase methodsFor!
exceptionCase	| sema |	sema := Semaphore new.	RsrProcessModel fork: [[Error signal] ensure: [sema signal]].	sema wait! !

!RsrTestingProcessModelTestCase methodsFor!
testNoException	| testCase |	testCase := self class selector: #noExceptionCase.	self		shouldnt: [testCase runCase]		raise: Exception! !

!RsrTestingProcessModelTestCase methodsFor!
noExceptionCase	| sema |	sema := Semaphore new.	RsrProcessModel fork: [sema signal].	sema wait! !

!RsrTestingProcessModelTestCase methodsFor!
testException	| testCase |	testCase := self class selector: #exceptionCase.	self		should: [testCase runCase]		raise: Exception! !

!RsrSocketPair methodsFor!
secondSocket: anObject	secondSocket := anObject! !

!RsrSocketPair methodsFor!
firstStream	^(RsrClassResolver classNamed: #RsrSocketStream) on: firstSocket! !

!RsrSocketPair methodsFor!
close	firstSocket close.	secondSocket close! !

!RsrSocketPair methodsFor!
firstSocket	^ firstSocket! !

!RsrSocketPair methodsFor!
firstSocket: anObject	firstSocket := anObject! !

!RsrSocketPair methodsFor!
secondStream	^(RsrClassResolver classNamed: #RsrSocketStream) on: secondSocket! !

!RsrSocketPair methodsFor!
secondSocket	^ secondSocket! !

!RsrClassResolverTestCase methodsFor!
testSuccessfulResolution	| actual |	actual := RsrClassResolver classNamed: #Object.	self		assert: actual		identicalTo: Object.	actual := RsrClassResolver		classNamed: #Object		ifAbsent: [self assert: false].	self		assert: actual		identicalTo: Object! !

!RsrClassResolverTestCase methodsFor!
testFailedResolution	| actual marker |	self		should: [RsrClassResolver classNamed: #Xlerb]		raise: RsrUnknownClass.	marker := Object new.	actual := RsrClassResolver		classNamed: #Xlerb		ifAbsent: [marker].	self		assert: actual		identicalTo: marker! !

!RsrClassResolverTestCase methodsFor!
assert: aClassNameresolvesTo: expectedClass	| actualClass |	actualClass := RsrClassResolver classNamed: aClassName.	self		assert: actualClass		identicalTo: expectedClass! !

!RsrMockService methodsFor!
initialize	super initialize.	_id := 1! !

!RsrMockService methodsFor!
isServer	^self class == RsrMockServer! !

!RsrMockService methodsFor!
isClient	^self class == RsrMockClient! !

!RsrMockService methodsFor!
service	^self! !

!RsrTestCase methodsFor!
runCase	| pm |	pm := RsrTestingProcessModel new.	RsrProcessModel current: pm.	[super runCase]		ensure:			[RsrProcessModel resetCurrent].	pm forkedException ifNotNil: [:ex | ex signal]! !

!RsrTestCase methodsFor!
hack: aString	"Placeholder for things that need to be fixed"! !

!RsrTestCase methodsFor!
assert: anObjectidenticalTo: bObject	self assert: anObject == bObject! !

!RsrTestCase methodsFor!
deny: anObjectidenticalTo: bObject	self assert: anObject ~~ bObject! !

!RsrTestCase methodsFor!
fork: aBlock	^RsrProcessModel fork: aBlock! !

!RsrTestCase methodsFor!
assumption: aString	"This method serves as a marker for assumptions made in the tests.	Perhaps some of the senders can be removed in the future."! !

!RsrTestCase methodsFor!
maximumReclamation	self assert: RsrGarbageCollector maximumReclamation! !

!RsrTestCase methodsFor!
defaultTimeLimit	^5 seconds! !

!RsrGarbageCollectorTestCase methodsFor!
testMaximumReclamation	self assert: RsrGarbageCollector maximumReclamation! !