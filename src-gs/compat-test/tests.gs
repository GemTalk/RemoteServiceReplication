run
Object
	subclass: #RsrMockService
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
TestCase
	subclass: #RsrTestCase
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrGarbageCollectorTestCase
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrRegistryTestCase
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrClassResolverTestCase
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrSocketTestCase
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%





set class RsrMockService

method:
rsrId
%

set class RsrTestCase class

classmethod:
isAbstract
%

set class RsrTestCase

method:
hack: aString
%



set class RsrTestCase

method:
defaultTimeLimit
%



set class RsrTestCase

method:
assert: anObject
%



set class RsrTestCase

method:
deny: anObject
%



set class RsrTestCase

method:
maximumReclamation
%

set class RsrGarbageCollectorTestCase

method:
testMaximumReclamation
%

set class RsrRegistryTestCase

method:
testRegister
%



set class RsrRegistryTestCase

method:
testRetain
%

set class RsrClassResolverTestCase

method:
assert: aClassName
%



set class RsrClassResolverTestCase

method:
testSuccessfulResolution
%



set class RsrClassResolverTestCase

method:
testFailedResolution
%

set class RsrSocketTestCase

method:
testConnectToClosedPort
%



set class RsrSocketTestCase

method:
assertWriting: bytes
%



set class RsrSocketTestCase

method:
randomPort
%



set class RsrSocketTestCase

method:
testConnectLocalSockets
%