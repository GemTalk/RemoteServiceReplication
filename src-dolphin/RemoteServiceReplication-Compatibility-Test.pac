| package |
package := Package name: 'RemoteServiceReplication-Compatibility-Test'.
package paxVersion: 1; basicComment: ''.

package classNames
	add: #RsrTestCase;
	add: #RsrSocketTestCase;
	add: #RsrMockServer;
	add: #RsrClassResolverTestCase;
	add: #RsrTestingConcurrencyTestCase;
	add: #RsrTestingConcurrency;
	add: #RsrGarbageCollectorTestCase;
	add: #RsrMockService;
	add: #RsrSocketPair;
	add: #RsrRegistryTestCase;
	add: #RsrMockClient;
	yourself.

package methodNames
	yourself.

package setPrerequisites: #('RemoteServiceReplication').

package!

RsrAbstractService
	subclass: #RsrMockService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMockService categoriesForClass!RemoteServiceReplication-Compatibility-Test-Support! !

RsrObject
	subclass: #RsrSocketPair
	instanceVariableNames: 'firstSocket secondSocket'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrSocketPair categoriesForClass!RemoteServiceReplication-Compatibility-Test-Utilities! !

RsrConcurrency
	subclass: #RsrTestingConcurrency
	instanceVariableNames: 'forkedException'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTestingConcurrency categoriesForClass!RemoteServiceReplication-Compatibility-Test-Support! !

RsrMockService
	subclass: #RsrMockClient
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMockClient categoriesForClass!RemoteServiceReplication-Compatibility-Test-Support! !

RsrMockService
	subclass: #RsrMockServer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMockServer categoriesForClass!RemoteServiceReplication-Compatibility-Test-Support! !

TestCase
	subclass: #RsrTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrTestCase comment: 'An abstract test class which contains utility methods'!
!RsrTestCase categoriesForClass!RemoteServiceReplication-Compatibility-Test-TestCases! !

RsrTestCase
	subclass: #RsrClassResolverTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrClassResolverTestCase comment: 'This class contains tests'!
!RsrClassResolverTestCase categoriesForClass!RemoteServiceReplication-Compatibility-Test-TestCases! !

RsrTestCase
	subclass: #RsrGarbageCollectorTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrGarbageCollectorTestCase comment: 'This class contains tests'!
!RsrGarbageCollectorTestCase categoriesForClass!RemoteServiceReplication-Compatibility-Test-TestCases! !

RsrTestCase
	subclass: #RsrRegistryTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrRegistryTestCase comment: 'I represent tests for the RsrRegistry.'!
!RsrRegistryTestCase categoriesForClass!RemoteServiceReplication-Compatibility-Test-TestCases! !

RsrTestCase
	subclass: #RsrSocketTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrSocketTestCase comment: 'This class contains tests'!
!RsrSocketTestCase categoriesForClass!RemoteServiceReplication-Compatibility-Test-TestCases! !

RsrTestCase
	subclass: #RsrTestingConcurrencyTestCase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrTestingConcurrencyTestCase comment: 'This class contains tests'!
!RsrTestingConcurrencyTestCase categoriesForClass!RemoteServiceReplication-Compatibility-Test-TestCases! !

!RsrSocketPair class methodsFor!
firstSocket: firstSocket

!RsrSocketPair class methodsFor!
new

!RsrSocketPair class methodsFor!
timeout

!RsrSocketPair class methodsFor!
listenPort

!RsrTestCase class methodsFor!
isAbstract

!RsrSocketTestCase methodsFor!
randomPort

!RsrSocketTestCase methodsFor!
assertWriting: bytes

!RsrSocketTestCase methodsFor!
testReadAvailable

!RsrSocketTestCase methodsFor!
testConnectLocalSockets

!RsrSocketTestCase methodsFor!
testHasDataAvailable

!RsrSocketTestCase methodsFor!
testConnectToClosedPort

!RsrSocketPair methodsFor!
secondSocket: anObject

!RsrSocketPair methodsFor!
firstStream

!RsrSocketPair methodsFor!
close

!RsrSocketPair methodsFor!
firstSocket

!RsrSocketPair methodsFor!
firstSocket: anObject

!RsrSocketPair methodsFor!
secondStream

!RsrSocketPair methodsFor!
secondSocket

!RsrTestingConcurrencyTestCase methodsFor!
exceptionCase

!RsrTestingConcurrencyTestCase methodsFor!
testException

!RsrTestingConcurrencyTestCase methodsFor!
noExceptionCase

!RsrTestingConcurrencyTestCase methodsFor!
testNoException

!RsrRegistryTestCase methodsFor!
testRemoveKey

!RsrRegistryTestCase methodsFor!
testIncludesKey

!RsrRegistryTestCase methodsFor!
testAddServer

!RsrRegistryTestCase methodsFor!
testAtAtIfAbsent

!RsrRegistryTestCase methodsFor!
testAddClient

!RsrClassResolverTestCase methodsFor!
testSuccessfulResolution

!RsrClassResolverTestCase methodsFor!
testFailedResolution

!RsrClassResolverTestCase methodsFor!
assert: aClassName

!RsrTestingConcurrency methodsFor!
forkedException

!RsrTestingConcurrency methodsFor!
protect: aBlock

!RsrTestingConcurrency methodsFor!
fork: aBlock

!RsrTestingConcurrency methodsFor!
fork: aBlock

!RsrMockService methodsFor!
isServer

!RsrMockService methodsFor!
_id

!RsrMockService methodsFor!
isClient

!RsrTestCase methodsFor!
runCase

!RsrTestCase methodsFor!
hack: aString

!RsrTestCase methodsFor!
assert: anObject

!RsrTestCase methodsFor!
fork: aBlock

!RsrTestCase methodsFor!
deny: anObject

!RsrTestCase methodsFor!
maximumReclamation

!RsrTestCase methodsFor!
defaultTimeLimit

!RsrGarbageCollectorTestCase methodsFor!
testMaximumReclamation