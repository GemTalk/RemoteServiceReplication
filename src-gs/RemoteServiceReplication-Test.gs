run
RsrObject
	subclass: #RsrMockRegistry
	instVarNames: #(#objects #idSpigot)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrObject
	subclass: #RsrSocketPair
	instVarNames: #(#firstSocket #secondSocket)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrObject
	subclass: #RsrMockConnection
	instVarNames: #(#forwarderClass #lastMessage #registry #idSpigot)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrForwarder
	subclass: #RsrMockForwarder
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrService
	subclass: #RsrAbstractTestService
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrService
	subclass: #RsrServiceAbstractNoInstVars
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrCodec
	subclass: #RsrMockEncoder
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrService
	subclass: #RsrServiceAbstractAllDataObjects
	instVarNames: #(#positiveSmallInteger #negativeSmallInteger #integerZero #string)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrService
	subclass: #RsrAbstractValueHolderService
	instVarNames: #(#value)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrService
	subclass: #RsrServiceAbstractReferenceService
	instVarNames: #(#service)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrRetainAnalysisTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrCodecTest
	instVarNames: #(#registry #decoder)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrServiceAbstractAllDataObjects
	subclass: #RsrServerAllDataObjects
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrSocketStreamTestCase
	instVarNames: #(#serverStream #clientStream)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrServiceAbstractAllDataObjects
	subclass: #RsrClientAllDataObjects
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrPromiseTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrAbstractValueHolderService
	subclass: #RsrValueHolderServer
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrObjectTestCase
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrServiceAbstractReferenceService
	subclass: #RsrServerReferenceService
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrAbstractValueHolderService
	subclass: #RsrValueHolderClient
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrServiceAbstractReferenceService
	subclass: #RsrClientReferenceService
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrNumericSpigotTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrAbstractTestService
	subclass: #RsrServerTestService
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrForwarderTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrServiceAbstractNoInstVars
	subclass: #RsrServerNoInstVars
	instVarNames: #(#marker)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrAbstractTestService
	subclass: #RsrClientTestService
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrServiceAbstractNoInstVars
	subclass: #RsrClientNoInstVars
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrTestCase
	subclass: #RsrSystemTestCase
	instVarNames: #(#connectionA #connectionB)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrCodecTest
	subclass: #RsrDecoderTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrObjectTestCase
	subclass: #RsrServiceTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrSystemTestCase
	subclass: #RsrServiceRegistryTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrNumericSpigotTest
	subclass: #RsrThreadSafeNumericSpigotTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrSystemTestCase
	subclass: #RsrMessageSendingTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrSystemTestCase
	subclass: #RsrLifetimeTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrSystemTestCase
	subclass: #RsrEvaluationClientTest
	instVarNames: #(#service)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%

run
RsrCodecTest
	subclass: #RsrEncoderTest
	instVarNames: #(#connection)
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
%





set class RsrMockRegistry

method:
objects
%



set class RsrMockRegistry

method:
initialize
%



set class RsrMockRegistry

method:
remember: anRsrObject
%



set class RsrMockRegistry

method:
newId
%



set class RsrMockRegistry

method:
connection
%



set class RsrMockRegistry

method:
objects: anObject
%



set class RsrMockRegistry

method:
register: anRsrObject
%



set class RsrMockRegistry

method:
retain: anRsrObject
%

set class RsrSocketPair class

classmethod:
listenPort
%



set class RsrSocketPair class

classmethod:
timeout
%



set class RsrSocketPair class

classmethod:
firstSocket: firstSocket
%



set class RsrSocketPair class

classmethod:
new
%

set class RsrSocketPair

method:
firstSocket
%



set class RsrSocketPair

method:
secondSocket: anObject
%



set class RsrSocketPair

method:
firstSocket: anObject
%



set class RsrSocketPair

method:
secondStream
%



set class RsrSocketPair

method:
secondSocket
%



set class RsrSocketPair

method:
close
%



set class RsrSocketPair

method:
firstStream
%

set class RsrMockConnection class

classmethod:
forwarderClass: aClass 
%

set class RsrMockConnection

method:
lastMessage
%



set class RsrMockConnection

method:
forwarderClass
%



set class RsrMockConnection

method:
encoder
%



set class RsrMockConnection

method:
registry
%



set class RsrMockConnection

method:
releaseOid: anInteger
%



set class RsrMockConnection

method:
rsrForwarderClass
%



set class RsrMockConnection

method:
rsrSendMessage: aMessage
%



set class RsrMockConnection

method:
forwarderClass: aClass
%



set class RsrMockConnection

method:
oidSpigot
%

set class RsrMockForwarder

method:
rsrObject
%

set class RsrAbstractTestService class

classmethod:
serverClass
%



set class RsrAbstractTestService class

classmethod:
clientClass
%

set class RsrAbstractTestService

method:
remoteSelf
%

set class RsrServiceAbstractNoInstVars class

classmethod:
serverClass
%



set class RsrServiceAbstractNoInstVars class

classmethod:
clientClass
%

set class RsrServiceAbstractNoInstVars

method:
sendReturnArgument: anObject
%



set class RsrServiceAbstractNoInstVars

method:
returnArgument: anObject
%

set class RsrMockEncoder

method:
encodeRetainObject: anObject
%



set class RsrMockEncoder

method:
encodeObject: anObject
%



set class RsrMockEncoder

method:
encode: anObject
%

set class RsrServiceAbstractAllDataObjects class

classmethod:
serverClass
%



set class RsrServiceAbstractAllDataObjects class

classmethod:
clientClass
%

set class RsrServiceAbstractAllDataObjects

method:
initialize
%

set class RsrAbstractValueHolderService class

classmethod:
value: anRsrObject
%



set class RsrAbstractValueHolderService class

classmethod:
serverClass
%



set class RsrAbstractValueHolderService class

classmethod:
clientClass
%

set class RsrAbstractValueHolderService

method:
value: anObject
%



set class RsrAbstractValueHolderService

method:
value
%

set class RsrServiceAbstractReferenceService class

classmethod:
service: aService
%



set class RsrServiceAbstractReferenceService class

classmethod:
serverClass
%



set class RsrServiceAbstractReferenceService class

classmethod:
clientClass
%

set class RsrServiceAbstractReferenceService

method:
service
%



set class RsrServiceAbstractReferenceService

method:
service: anObject
%

set class RsrRetainAnalysisTest

method:
testServiceNoInstVars
%



set class RsrRetainAnalysisTest

method:
testNewServicesInDictionary
%



set class RsrRetainAnalysisTest

method:
testServiceReferencingAnotherService
%



set class RsrRetainAnalysisTest

method:
testServiceAllDataObjects
%



set class RsrRetainAnalysisTest

method:
testNewServiceInArray
%



set class RsrRetainAnalysisTest

method:
testServiceWithCycle
%

set class RsrCodecTest class

classmethod:
isAbstract
%

set class RsrCodecTest

method:
testDateTime
%



set class RsrCodecTest

method:
testString
%



set class RsrCodecTest

method:
genericSymbol
%



set class RsrCodecTest

method:
testSet
%



set class RsrCodecTest

method:
verifyImmediate: anImmediateObject
%



set class RsrCodecTest

method:
serviceNoInstVarsEncoding
%



set class RsrCodecTest

method:
encoder
%



set class RsrCodecTest

method:
testSymbol
%



set class RsrCodecTest

method:
testArray
%



set class RsrCodecTest

method:
testControlWord
%



set class RsrCodecTest

method:
rootServiceEncoding
%



set class RsrCodecTest

method:
genericSymbolEncoding
%



set class RsrCodecTest

method:
referencedServiceEncoding
%



set class RsrCodecTest

method:
testOrderedCollection
%



set class RsrCodecTest

method:
testDictionary
%



set class RsrCodecTest

method:
verifyControlWord: anInteger
%



set class RsrCodecTest

method:
testByteArray
%



set class RsrCodecTest

method:
decoder
%



set class RsrCodecTest

method:
encodeReferenceOf: anObject
%

set class RsrSocketStreamTestCase

method:
listenPort
%



set class RsrSocketStreamTestCase

method:
setUp
%



set class RsrSocketStreamTestCase

method:
tearDown
%



set class RsrSocketStreamTestCase

method:
testClose
%



set class RsrSocketStreamTestCase

method:
initializeStreams
%

set class RsrPromiseTest

method:
testFulfillment
%



set class RsrPromiseTest

method:
testError
%

set class RsrObjectTestCase class

classmethod:
isAbstract
%

set class RsrObjectTestCase

method:
newInstance
%



set class RsrObjectTestCase

method:
testInitialization
%



set class RsrObjectTestCase

method:
testIsMirrored
%

set class RsrNumericSpigotTest

method:
spigotClass
%



set class RsrNumericSpigotTest

method:
testDefault
%



set class RsrNumericSpigotTest

method:
testNegativeStep
%



set class RsrNumericSpigotTest

method:
testNext
%



set class RsrNumericSpigotTest

method:
testNaturals
%



set class RsrNumericSpigotTest

method:
testFloat
%

set class RsrForwarderTest

method:
testForwarding
%

set class RsrServerNoInstVars

method:
setMarker
%



set class RsrServerNoInstVars

method:
returnNewServiceInArray
%



set class RsrServerNoInstVars

method:
marker
%



set class RsrServerNoInstVars

method:
unaryReturn42
%



set class RsrServerNoInstVars

method:
returnTestSymbol
%



set class RsrServerNoInstVars

method:
returnNewService
%

set class RsrClientNoInstVars

method:
sendReturnTestSymbol
%



set class RsrClientNoInstVars

method:
sendSetMarker
%



set class RsrClientNoInstVars

method:
sendReturnNewService
%



set class RsrClientNoInstVars

method:
sendUnaryReturn42Message
%



set class RsrClientNoInstVars

method:
sendReturnNewServiceInArray
%

set class RsrSystemTestCase class

classmethod:
isAbstract
%

set class RsrSystemTestCase

method:
sharedNamespaceA
%



set class RsrSystemTestCase

method:
setUp
%



set class RsrSystemTestCase

method:
sharedNamespaceB
%



set class RsrSystemTestCase

method:
tearDown
%

set class RsrDecoderTest

method:
testSendMessage
%



set class RsrDecoderTest

method:
testServiceNoInstVars
%



set class RsrDecoderTest

method:
assertReference: bytes
%



set class RsrDecoderTest

method:
testServiceReferenceService
%



set class RsrDecoderTest

method:
verifyImmediate: expected
%



set class RsrDecoderTest

method:
testRetainObject
%



set class RsrDecoderTest

method:
testDeliverResponse
%



set class RsrDecoderTest

method:
testServiceDecodeIdentity
%



set class RsrDecoderTest

method:
testReleaseObjects
%



set class RsrDecoderTest

method:
verifyControlWord: expected
%



set class RsrDecoderTest

method:
decode: anObjectBytes
%

set class RsrServiceTest

method:
newInstance
%



set class RsrServiceTest

method:
testHasRemoteSelf
%

set class RsrServiceRegistryTest

method:
testRegistration
%



set class RsrServiceRegistryTest

method:
testCloseWithDanglingObjectInRegistry
%

set class RsrThreadSafeNumericSpigotTest

method:
spigotClass
%

set class RsrMessageSendingTest

method:
testReturnInvalidObject
%



set class RsrMessageSendingTest

method:
testReturnNewServiceInArray
%



set class RsrMessageSendingTest

method:
testReturnNewService
%



set class RsrMessageSendingTest

method:
testReturnArgument
%



set class RsrMessageSendingTest

method:
testSendSetMarker
%



set class RsrMessageSendingTest

method:
testRemoteError
%



set class RsrMessageSendingTest

method:
testReturnSymbol
%



set class RsrMessageSendingTest

method:
testSendInvalidObject
%

set class RsrLifetimeTest

method:
testCloseWithDanglingObject
%



set class RsrLifetimeTest

method:
testRemoteReferenceLifetime
%

set class RsrEvaluationClientTest

method:
testEvaluteLiterals
%



set class RsrEvaluationClientTest

method:
setUp
%



set class RsrEvaluationClientTest

method:
literals
%



set class RsrEvaluationClientTest

method:
testEvaluteService
%

set class RsrEncoderTest

method:
testSendMessage
%



set class RsrEncoderTest

method:
testServiceNoInstVars
%



set class RsrEncoderTest

method:
testServiceReferenceService
%



set class RsrEncoderTest

method:
verifyImmediate: anObject
%



set class RsrEncoderTest

method:
setUp
%



set class RsrEncoderTest

method:
testRetainObject
%



set class RsrEncoderTest

method:
testDeliverResponse
%



set class RsrEncoderTest

method:
register: aService
%



set class RsrEncoderTest

method:
testReleaseObjects
%



set class RsrEncoderTest

method:
verifyControlWord: anInteger
%



set class RsrEncoderTest

method:
tearDown
%