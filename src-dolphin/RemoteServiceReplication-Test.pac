| package |
package := Package name: 'RemoteServiceReplication-Test'.
package paxVersion: 1; basicComment: ''.

package classNames
	add: #RsrThreadSafeNumericSpigotTest;
	add: #RsrDecoderTest;
	add: #RsrEncoderTest;
	add: #RsrReflectedVariableTestServer;
	add: #RsrForwarderTest;
	add: #RsrMockEncoder;
	add: #RsrMockConnection;
	add: #RsrServiceTest;
	add: #RsrAbstractReflectedVariableTestServiceA;
	add: #RsrSocketStreamTestCase;
	add: #RsrClientAllDataObjects;
	add: #RsrServerNoInstVars;
	add: #RsrPromiseTest;
	add: #RsrSpeciesReturnEquality;
	add: #RsrAbstractTestService;
	add: #RsrNumericSpigotTest;
	add: #RsrAbstractReferenceAllSpecies;
	add: #RsrMockRegistry;
	add: #RsrMessageSendingTest;
	add: #RsrAbstractReflectedVariableTestServiceB;
	add: #RsrSystemTestCase;
	add: #RsrServerAllDataObjects;
	add: #RsrValueHolderClient;
	add: #RsrServiceAbstractReferenceService;
	add: #RsrClientTestService;
	add: #RsrReferenceAllSpeciesClient;
	add: #RsrCodecTest;
	add: #RsrServerTestService;
	add: #RsrClientReferenceService;
	add: #RsrReflectedVariableTestClient;
	add: #RsrLifetimeTest;
	add: #RsrServiceAbstractNoInstVars;
	add: #RsrValueHolderServer;
	add: #RsrReferenceAllSpeciesServer;
	add: #RsrRetainAnalysisTest;
	add: #RsrServiceAbstractAllDataObjects;
	add: #RsrAbstractValueHolderService;
	add: #RsrServerReferenceService;
	add: #RsrClientNoInstVars;
	yourself.

package methodNames
	yourself.

package setPrerequisites: #('RemoteServiceReplication-Compatibility-Test').

package!

RsrObject
	subclass: #RsrMockConnection
	instanceVariableNames: 'forwarderClass lastMessage registry idSpigot'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMockConnection categoriesForClass!RemoteServiceReplication-Test-Mocks! !

RsrObject
	subclass: #RsrMockRegistry
	instanceVariableNames: 'objects idSpigot'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMockRegistry categoriesForClass!RemoteServiceReplication-Test-Mocks! !

RsrService
	subclass: #RsrAbstractReferenceAllSpecies
	instanceVariableNames: 'emptyService serviceReferenceService emptySymbol symbol emptyString string largeNegative smallNegative zero smallPositive largePositive asciiCharacter undefinedObject booleanTrue booleanFalse emptyArray array emptyByteArray byteArray emptyOrderedCollection orderedCollection emptyDictionary dictionary epoch beforeEpoch afterEpoch arrayWithAllTypes emptySet set setWithAllTypes orderedCollectionWithAllTypes dictionaryWithAllTypes unicodeCharacter'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrAbstractReferenceAllSpecies categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrService
	subclass: #RsrAbstractReflectedVariableTestServiceA
	instanceVariableNames: 'varA'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrAbstractReflectedVariableTestServiceA categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrService
	subclass: #RsrAbstractTestService
	instanceVariableNames: 'sharedVariable'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrAbstractTestService categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrService
	subclass: #RsrAbstractValueHolderService
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrAbstractValueHolderService categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrService
	subclass: #RsrServiceAbstractAllDataObjects
	instanceVariableNames: 'positiveSmallInteger negativeSmallInteger integerZero string'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrServiceAbstractAllDataObjects categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrService
	subclass: #RsrServiceAbstractNoInstVars
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrServiceAbstractNoInstVars categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrService
	subclass: #RsrServiceAbstractReferenceService
	instanceVariableNames: 'service'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrServiceAbstractReferenceService categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrAbstractReflectedVariableTestServiceA
	subclass: #RsrAbstractReflectedVariableTestServiceB
	instanceVariableNames: 'varB'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrAbstractReflectedVariableTestServiceB categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrServiceAbstractAllDataObjects
	subclass: #RsrClientAllDataObjects
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrClientAllDataObjects categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrServiceAbstractNoInstVars
	subclass: #RsrClientNoInstVars
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrClientNoInstVars categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrServiceAbstractReferenceService
	subclass: #RsrClientReferenceService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrClientReferenceService categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrAbstractTestService
	subclass: #RsrClientTestService
	instanceVariableNames: 'privateVariable'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrClientTestService categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrTestCase
	subclass: #RsrCodecTest
	instanceVariableNames: 'registry decoder'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrCodecTest comment: 'This class contains tests'!
!RsrCodecTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrTestCase
	subclass: #RsrForwarderTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrForwarderTest comment: 'This class contains tests'!
!RsrForwarderTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrEncoder
	subclass: #RsrMockEncoder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMockEncoder categoriesForClass!RemoteServiceReplication-Test-Mocks! !

RsrTestCase
	subclass: #RsrNumericSpigotTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrNumericSpigotTest comment: 'This class contains tests'!
!RsrNumericSpigotTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrTestCase
	subclass: #RsrPromiseTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrPromiseTest comment: 'This class contains tests'!
!RsrPromiseTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrAbstractReferenceAllSpecies
	subclass: #RsrReferenceAllSpeciesClient
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrReferenceAllSpeciesClient categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrAbstractReferenceAllSpecies
	subclass: #RsrReferenceAllSpeciesServer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrReferenceAllSpeciesServer categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrTestCase
	subclass: #RsrRetainAnalysisTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrRetainAnalysisTest comment: 'This class contains tests'!
!RsrRetainAnalysisTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrServiceAbstractAllDataObjects
	subclass: #RsrServerAllDataObjects
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrServerAllDataObjects categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrServiceAbstractNoInstVars
	subclass: #RsrServerNoInstVars
	instanceVariableNames: 'marker'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrServerNoInstVars categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrServiceAbstractReferenceService
	subclass: #RsrServerReferenceService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrServerReferenceService categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrAbstractTestService
	subclass: #RsrServerTestService
	instanceVariableNames: 'privateVariable'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrServerTestService categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrTestCase
	subclass: #RsrSocketStreamTestCase
	instanceVariableNames: 'serverStream clientStream'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrSocketStreamTestCase comment: 'This class contains tests'!
!RsrSocketStreamTestCase categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrTestCase
	subclass: #RsrSystemTestCase
	instanceVariableNames: 'connectionA connectionB'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrSystemTestCase comment: 'This class contains tests'!
!RsrSystemTestCase categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrAbstractValueHolderService
	subclass: #RsrValueHolderClient
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrValueHolderClient categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrAbstractValueHolderService
	subclass: #RsrValueHolderServer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrValueHolderServer categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrCodecTest
	subclass: #RsrDecoderTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrDecoderTest comment: 'This class contains tests'!
!RsrDecoderTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrCodecTest
	subclass: #RsrEncoderTest
	instanceVariableNames: 'connection'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrEncoderTest comment: 'This class contains tests'!
!RsrEncoderTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrSystemTestCase
	subclass: #RsrLifetimeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrLifetimeTest comment: 'This class contains tests'!
!RsrLifetimeTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrSystemTestCase
	subclass: #RsrMessageSendingTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrMessageSendingTest comment: 'This class contains tests'!
!RsrMessageSendingTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrAbstractReflectedVariableTestServiceB
	subclass: #RsrReflectedVariableTestClient
	instanceVariableNames: 'private'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrReflectedVariableTestClient categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrAbstractReflectedVariableTestServiceB
	subclass: #RsrReflectedVariableTestServer
	instanceVariableNames: 'private'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrReflectedVariableTestServer categoriesForClass!RemoteServiceReplication-Test-Services! !

RsrSystemTestCase
	subclass: #RsrServiceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrServiceTest comment: 'This class contains tests'!
!RsrServiceTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrSystemTestCase
	subclass: #RsrSpeciesReturnEquality
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrSpeciesReturnEquality comment: 'This class contains tests'!
!RsrSpeciesReturnEquality categoriesForClass!RemoteServiceReplication-Test-TestCases! !

RsrNumericSpigotTest
	subclass: #RsrThreadSafeNumericSpigotTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrThreadSafeNumericSpigotTest comment: 'This class contains tests'!
!RsrThreadSafeNumericSpigotTest categoriesForClass!RemoteServiceReplication-Test-TestCases! !

!RsrServiceAbstractNoInstVars class methodsFor!
clientClassName

!RsrServiceAbstractNoInstVars class methodsFor!
serverClassName

!RsrSystemTestCase class methodsFor!
isAbstract

!RsrAbstractReferenceAllSpecies class methodsFor!
clientClassName

!RsrAbstractReferenceAllSpecies class methodsFor!
serverClassName

!RsrServiceAbstractReferenceService class methodsFor!
clientClassName

!RsrServiceAbstractReferenceService class methodsFor!
service: aService

!RsrServiceAbstractReferenceService class methodsFor!
serverClassName

!RsrAbstractValueHolderService class methodsFor!
clientClassName

!RsrAbstractValueHolderService class methodsFor!
value: anRsrObject

!RsrAbstractValueHolderService class methodsFor!
serverClassName

!RsrServiceAbstractAllDataObjects class methodsFor!
clientClassName

!RsrServiceAbstractAllDataObjects class methodsFor!
serverClassName

!RsrMockConnection class methodsFor!
forwarderClass: aClass 

!RsrAbstractTestService class methodsFor!
clientClassName

!RsrAbstractTestService class methodsFor!
serverClassName

!RsrAbstractReflectedVariableTestServiceB class methodsFor!
clientClassName

!RsrAbstractReflectedVariableTestServiceB class methodsFor!
serverClassName

!RsrCodecTest class methodsFor!
isAbstract

!RsrServerNoInstVars methodsFor!
returnTestSymbol

!RsrServerNoInstVars methodsFor!
returnNewService

!RsrServerNoInstVars methodsFor!
setMarker

!RsrServerNoInstVars methodsFor!
signalError

!RsrServerNoInstVars methodsFor!
unaryReturn42

!RsrServerNoInstVars methodsFor!
returnObjectNew

!RsrServerNoInstVars methodsFor!
marker

!RsrServerNoInstVars methodsFor!
returnNewServiceInArray

!RsrServerNoInstVars methodsFor!
returnSelf

!RsrAbstractReferenceAllSpecies methodsFor!
initialize

!RsrServerTestService methodsFor!
privateVariable

!RsrServerTestService methodsFor!
privateVariable: anObject

!RsrServiceAbstractNoInstVars methodsFor!
sendReturnArgument: anObject

!RsrServiceAbstractNoInstVars methodsFor!
returnArgument: anObject

!RsrClientTestService methodsFor!
privateVariable

!RsrClientTestService methodsFor!
privateVariable: anObject

!RsrMockEncoder methodsFor!
encodeRetainObject: anObject

!RsrMockEncoder methodsFor!
encode: anObject

!RsrMockEncoder methodsFor!
encodeObject: anObject

!RsrRetainAnalysisTest methodsFor!
testServiceAllDataObjects

!RsrRetainAnalysisTest methodsFor!
assertCycle: anObject

!RsrRetainAnalysisTest methodsFor!
testSetCycle

!RsrRetainAnalysisTest methodsFor!
analyze: anObject

!RsrRetainAnalysisTest methodsFor!
testArrayCycle

!RsrRetainAnalysisTest methodsFor!
testNewServiceInArray

!RsrRetainAnalysisTest methodsFor!
testServiceNoInstVars

!RsrRetainAnalysisTest methodsFor!
testOrderedCollectionCycle

!RsrRetainAnalysisTest methodsFor!
testServiceWithCycle

!RsrRetainAnalysisTest methodsFor!
testDictionaryCycle

!RsrRetainAnalysisTest methodsFor!
testNewServicesInDictionary

!RsrRetainAnalysisTest methodsFor!
testServiceReferencingAnotherService

!RsrThreadSafeNumericSpigotTest methodsFor!
spigotClass

!RsrMessageSendingTest methodsFor!
testReturnNewService

!RsrMessageSendingTest methodsFor!
testRemoteError

!RsrMessageSendingTest methodsFor!
testReturnInvalidObject

!RsrMessageSendingTest methodsFor!
testReturnArgument

!RsrMessageSendingTest methodsFor!
testSendInvalidObject

!RsrMessageSendingTest methodsFor!
testReturnNewServiceInArray

!RsrMessageSendingTest methodsFor!
testSendSetMarker

!RsrMessageSendingTest methodsFor!
testReturnSymbol

!RsrServiceAbstractReferenceService methodsFor!
service: anObject

!RsrServiceAbstractReferenceService methodsFor!
service

!RsrAbstractValueHolderService methodsFor!
value

!RsrAbstractValueHolderService methodsFor!
value: anObject

!RsrServiceTest methodsFor!
testInitialization

!RsrServiceTest methodsFor!
testHasRemoteSelf

!RsrServiceTest methodsFor!
testIsMirrored

!RsrServiceTest methodsFor!
mirror: aService

!RsrServiceTest methodsFor!
newInstance

!RsrServiceTest methodsFor!
testReflectedVariableNames

!RsrServiceTest methodsFor!
testVariableReflection

!RsrSpeciesReturnEquality methodsFor!
testUnicodeString

!RsrSpeciesReturnEquality methodsFor!
testServiceWithUnsupportedObject

!RsrSpeciesReturnEquality methodsFor!
testCharacter

!RsrSpeciesReturnEquality methodsFor!
testArray

!RsrSpeciesReturnEquality methodsFor!
basicExamples

!RsrSpeciesReturnEquality methodsFor!
verify: anObject

!RsrSpeciesReturnEquality methodsFor!
testString

!RsrSpeciesReturnEquality methodsFor!
unicodeString

!RsrSpeciesReturnEquality methodsFor!
testByteArray

!RsrSpeciesReturnEquality methodsFor!
testUnicodeSymbol

!RsrSpeciesReturnEquality methodsFor!
testBoolean

!RsrSpeciesReturnEquality methodsFor!
testUndefinedObject

!RsrSpeciesReturnEquality methodsFor!
testSet

!RsrSpeciesReturnEquality methodsFor!
testDictionary

!RsrSpeciesReturnEquality methodsFor!
testDateAndTime

!RsrSpeciesReturnEquality methodsFor!
testService

!RsrSpeciesReturnEquality methodsFor!
testOrderedCollection

!RsrSpeciesReturnEquality methodsFor!
testInteger

!RsrSpeciesReturnEquality methodsFor!
testSymbol

!RsrSystemTestCase methodsFor!
tearDown

!RsrSystemTestCase methodsFor!
setUp

!RsrCodecTest methodsFor!
serviceNoInstVarsEncoding

!RsrCodecTest methodsFor!
testDateTime

!RsrCodecTest methodsFor!
decoder

!RsrCodecTest methodsFor!
verifyControlWord: anInteger

!RsrCodecTest methodsFor!
genericSymbol

!RsrCodecTest methodsFor!
testArray

!RsrCodecTest methodsFor!
verifyImmediate: anImmediateObject

!RsrCodecTest methodsFor!
testString

!RsrCodecTest methodsFor!
testByteArray

!RsrCodecTest methodsFor!
rootServiceEncoding

!RsrCodecTest methodsFor!
referencedServiceEncoding

!RsrCodecTest methodsFor!
encoder

!RsrCodecTest methodsFor!
testSet

!RsrCodecTest methodsFor!
encodeReferenceOf: anObject

!RsrCodecTest methodsFor!
testDictionary

!RsrCodecTest methodsFor!
genericSymbolEncoding

!RsrCodecTest methodsFor!
testOrderedCollection

!RsrCodecTest methodsFor!
testSymbol

!RsrCodecTest methodsFor!
testControlWord

!RsrServiceAbstractAllDataObjects methodsFor!
initialize

!RsrAbstractTestService methodsFor!
sharedVariable: anObject

!RsrAbstractTestService methodsFor!
remoteSelf

!RsrAbstractTestService methodsFor!
sharedVariable

!RsrPromiseTest methodsFor!
testFulfillment

!RsrPromiseTest methodsFor!
testError

!RsrNumericSpigotTest methodsFor!
testNext

!RsrNumericSpigotTest methodsFor!
spigotClass

!RsrNumericSpigotTest methodsFor!
testNaturals

!RsrNumericSpigotTest methodsFor!
testDefault

!RsrNumericSpigotTest methodsFor!
testNegativeStep

!RsrNumericSpigotTest methodsFor!
testFloat

!RsrMockRegistry methodsFor!
objects

!RsrMockRegistry methodsFor!
connection

!RsrMockRegistry methodsFor!
initialize

!RsrMockRegistry methodsFor!
objects: anObject

!RsrMockRegistry methodsFor!
register: anRsrObject

!RsrMockRegistry methodsFor!
newId

!RsrMockRegistry methodsFor!
retain: anRsrObject

!RsrMockRegistry methodsFor!
at: aKey

!RsrMockRegistry methodsFor!
remember: anRsrObject

!RsrMockConnection methodsFor!
_sendMessage: aMessage

!RsrMockConnection methodsFor!
encoder

!RsrMockConnection methodsFor!
oidSpigot

!RsrMockConnection methodsFor!
_forwarderClass

!RsrMockConnection methodsFor!
lastMessage

!RsrMockConnection methodsFor!
registry

!RsrMockConnection methodsFor!
releaseOid: anInteger! !

!RsrMockConnection methodsFor!
forwarderClass: aClass

!RsrLifetimeTest methodsFor!
testCloseWithDanglingObject

!RsrLifetimeTest methodsFor!
testRemoteReferenceLifetime

!RsrLifetimeTest methodsFor!
testObjectCreatedViaServiceFactory

!RsrClientNoInstVars methodsFor!
sendReturnTestSymbol

!RsrClientNoInstVars methodsFor!
sendSetMarker

!RsrClientNoInstVars methodsFor!
sendUnaryReturn42Message

!RsrClientNoInstVars methodsFor!
sendSignalError

!RsrClientNoInstVars methodsFor!
sendReturnNewServiceInArray

!RsrClientNoInstVars methodsFor!
sendReturnNewService

!RsrClientNoInstVars methodsFor!
sendReturnObjectNew

!RsrClientNoInstVars methodsFor!
sendReturnSelf

!RsrDecoderTest methodsFor!
decodeService: anObjectBytes

!RsrDecoderTest methodsFor!
testServiceDecodeIdentity

!RsrDecoderTest methodsFor!
testServiceReferenceService

!RsrDecoderTest methodsFor!
testRetainObject

!RsrDecoderTest methodsFor!
testDeliverResponse

!RsrDecoderTest methodsFor!
verifyImmediate: expected

!RsrDecoderTest methodsFor!
testServiceNoInstVars

!RsrDecoderTest methodsFor!
assertReference: bytes

!RsrDecoderTest methodsFor!
verifyControlWord: expected

!RsrDecoderTest methodsFor!
testSendMessage

!RsrDecoderTest methodsFor!
testReleaseObjects

!RsrForwarderTest methodsFor!
testForwarding

!RsrEncoderTest methodsFor!
setUp

!RsrEncoderTest methodsFor!
tearDown

!RsrEncoderTest methodsFor!
testUnsupportedObject

!RsrEncoderTest methodsFor!
testRetainObject

!RsrEncoderTest methodsFor!
testServiceReferenceService

!RsrEncoderTest methodsFor!
testDeliverResponse

!RsrEncoderTest methodsFor!
verifyImmediate: anObject

!RsrEncoderTest methodsFor!
testServiceNoInstVars

!RsrEncoderTest methodsFor!
verifyControlWord: anInteger

!RsrEncoderTest methodsFor!
register: aService

!RsrEncoderTest methodsFor!
testSendMessage

!RsrEncoderTest methodsFor!
testReleaseObjects

!RsrSocketStreamTestCase methodsFor!
tearDown

!RsrSocketStreamTestCase methodsFor!
setUp

!RsrSocketStreamTestCase methodsFor!
initializeStreams

!RsrSocketStreamTestCase methodsFor!
testClose

!RsrSocketStreamTestCase methodsFor!
listenPort