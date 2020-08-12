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
clientClassName

!RsrMockService class methodsFor!
serverClassName

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

!RsrTestingProcessModel methodsFor!
forkedException

!RsrTestingProcessModel methodsFor!
protect: aBlock

!RsrTestingProcessModel methodsFor!
fork: aBlock

!RsrTestingProcessModel methodsFor!
fork: aBlock

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

!RsrTestingProcessModelTestCase methodsFor!
testCurrentStackDump

!RsrTestingProcessModelTestCase methodsFor!
exceptionCase

!RsrTestingProcessModelTestCase methodsFor!
testNoException

!RsrTestingProcessModelTestCase methodsFor!
noExceptionCase

!RsrTestingProcessModelTestCase methodsFor!
testException

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

!RsrClassResolverTestCase methodsFor!
testSuccessfulResolution

!RsrClassResolverTestCase methodsFor!
testFailedResolution

!RsrClassResolverTestCase methodsFor!
assert: aClassName

!RsrMockService methodsFor!
initialize

!RsrMockService methodsFor!
isServer

!RsrMockService methodsFor!
isClient

!RsrMockService methodsFor!
service

!RsrTestCase methodsFor!
runCase

!RsrTestCase methodsFor!
hack: aString

!RsrTestCase methodsFor!
assert: anObject

!RsrTestCase methodsFor!
deny: anObject

!RsrTestCase methodsFor!
fork: aBlock

!RsrTestCase methodsFor!
assumption: aString

!RsrTestCase methodsFor!
maximumReclamation

!RsrTestCase methodsFor!
defaultTimeLimit

!RsrGarbageCollectorTestCase methodsFor!
testMaximumReclamation