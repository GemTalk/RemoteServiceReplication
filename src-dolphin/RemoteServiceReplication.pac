| package |
package := Package name: 'RemoteServiceReplication'.
package paxVersion: 1; basicComment: ''.

package classNames
	add: #RsrService;
	add: #RsrStream;
	add: #RsrEncoder;
	add: #RsrThreadSafeNumericSpigot;
	add: #RsrSendMessage;
	add: #RsrUnknownOID;
	add: #RsrRetainAnalysis;
	add: #RsrDecoder;
	add: #RsrSocketStream;
	add: #RsrCycleDetected;
	add: #RsrNumericSpigot;
	add: #RsrCodec;
	add: #RsrLogWithPrefix;
	add: #RsrBufferedSocketStream;
	add: #RsrLog;
	add: #RsrPromise;
	add: #RsrConnection;
	add: #RsrRetainObject;
	add: #RsrCommandSink;
	add: #RsrServiceFactoryServer;
	add: #RsrReleaseObjects;
	add: #RsrCommandSource;
	add: #RsrServiceFactory;
	add: #RsrDeliverResponse;
	add: #RsrObjectCache;
	add: #RsrDispatchEventLoop;
	add: #RsrAbstractServiceFactory;
	add: #RsrMessageDispatcher;
	add: #RsrCommand;
	add: #RsrEventLoop;
	yourself.

package methodNames
	add: #RsrForwarder -> #doesNotUnderstand:;
	add: #RsrForwarder -> #_service:;
	add: 'RsrForwarder class' -> #on:;
	yourself.

package setPrerequisites: #('RemoteServiceReplication-Compatibility-Dolphin').

package!

RsrObject
	subclass: #RsrBufferedSocketStream
	instanceVariableNames: 'stream outBuffer writePosition nextToWrite'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrBufferedSocketStream categoriesForClass!RemoteServiceReplication-Utilities! !

RsrObject
	subclass: #RsrCodec
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCodec categoriesForClass!RemoteServiceReplication-Communications! !

RsrObject
	subclass: #RsrCommand
	instanceVariableNames: 'encoding'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCommand categoriesForClass!RemoteServiceReplication-Communications! !

RsrObject
	subclass: #RsrConnection
	instanceVariableNames: 'isOpen transactionSpigot commandWriter commandReader registry objectCache socket stream promises dispatcher oidSpigot serviceFactory log'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrConnection categoriesForClass!RemoteServiceReplication-Communications! !

RsrObject
	subclass: #RsrEventLoop
	instanceVariableNames: 'process connection state'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrEventLoop categoriesForClass!RemoteServiceReplication-Communications! !

RsrObject
	subclass: #RsrLog
	instanceVariableNames: 'verbosity'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrLog categoriesForClass!RemoteServiceReplication-Debugging! !

RsrObject
	subclass: #RsrLogWithPrefix
	instanceVariableNames: 'prefix log'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrLogWithPrefix categoriesForClass!RemoteServiceReplication-Debugging! !

RsrObject
	subclass: #RsrNumericSpigot
	instanceVariableNames: 'current step'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrNumericSpigot categoriesForClass!RemoteServiceReplication-Utilities! !

RsrObject
	subclass: #RsrObjectCache
	instanceVariableNames: 'storage'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrObjectCache categoriesForClass!RemoteServiceReplication-Utilities! !

RsrObject
	subclass: #RsrPromise
	instanceVariableNames: 'mutex value error markerValue'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrPromise categoriesForClass!RemoteServiceReplication-Utilities! !

RsrObject
	subclass: #RsrRetainAnalysis
	instanceVariableNames: 'roots retainCommands inFlight connection'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrRetainAnalysis categoriesForClass!RemoteServiceReplication-Communications! !

RsrAbstractService
	subclass: #RsrService
	instanceVariableNames: '_id _connection remoteSelf'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrService comment: 'I represent a class of Objects that know offer Rsr Services.'!
!RsrService categoriesForClass!RemoteServiceReplication-Public! !

RsrObject
	subclass: #RsrSocketStream
	instanceVariableNames: 'socket'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrSocketStream categoriesForClass!RemoteServiceReplication-Utilities! !

RsrObject
	subclass: #RsrStream
	instanceVariableNames: 'stream'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrStream categoriesForClass!RemoteServiceReplication-Communications! !

RsrService
	subclass: #RsrAbstractServiceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrAbstractServiceFactory categoriesForClass!RemoteServiceReplication-Public-Examples! !

RsrEventLoop
	subclass: #RsrCommandSink
	instanceVariableNames: 'queue'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCommandSink categoriesForClass!RemoteServiceReplication-Communications! !

RsrEventLoop
	subclass: #RsrCommandSource
	instanceVariableNames: 'decoder'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCommandSource categoriesForClass!RemoteServiceReplication-Communications! !

RsrCodec
	subclass: #RsrDecoder
	instanceVariableNames: 'registry connection decodeCommandMap'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrDecoder categoriesForClass!RemoteServiceReplication-Communications! !

RsrCommand
	subclass: #RsrDeliverResponse
	instanceVariableNames: 'transaction errorName response retainList'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrDeliverResponse categoriesForClass!RemoteServiceReplication-Communications! !

RsrEventLoop
	subclass: #RsrDispatchEventLoop
	instanceVariableNames: 'queue'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrDispatchEventLoop categoriesForClass!RemoteServiceReplication-Communications! !

RsrCodec
	subclass: #RsrEncoder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrEncoder categoriesForClass!RemoteServiceReplication-Communications! !

RsrCommand
	subclass: #RsrReleaseObjects
	instanceVariableNames: 'oids'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrReleaseObjects categoriesForClass!RemoteServiceReplication-Communications! !

RsrCommand
	subclass: #RsrRetainObject
	instanceVariableNames: 'object'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrRetainObject categoriesForClass!RemoteServiceReplication-Communications! !

RsrCommand
	subclass: #RsrSendMessage
	instanceVariableNames: 'transaction receiver selector arguments retainList'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrSendMessage categoriesForClass!RemoteServiceReplication-Communications! !

RsrNumericSpigot
	subclass: #RsrThreadSafeNumericSpigot
	instanceVariableNames: 'mutex'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrThreadSafeNumericSpigot categoriesForClass!RemoteServiceReplication-Utilities! !

RsrError
	subclass: #RsrCycleDetected
	instanceVariableNames: 'object'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCycleDetected categoriesForClass!RemoteServiceReplication-Exceptions! !

RsrDispatchEventLoop
	subclass: #RsrMessageDispatcher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMessageDispatcher categoriesForClass!RemoteServiceReplication-Communications! !

RsrAbstractServiceFactory
	subclass: #RsrServiceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrServiceFactory categoriesForClass!RemoteServiceReplication-Public-Examples! !

RsrAbstractServiceFactory
	subclass: #RsrServiceFactoryServer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrServiceFactoryServer categoriesForClass!RemoteServiceReplication-Public-Examples! !

RsrError
	subclass: #RsrUnknownOID
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrUnknownOID categoriesForClass!RemoteServiceReplication-Exceptions! !

!RsrForwarder class methodsFor!
on: anRsrObject

!RsrForwarder methodsFor!
doesNotUnderstand: aMessage

!RsrForwarder methodsFor!
_service: aService

!RsrService class methodsFor!
_id: anId

!RsrService class methodsFor!
isServerClass

!RsrService class methodsFor!
serverClassName

!RsrService class methodsFor!
isClientClass

!RsrService class methodsFor!
_variablesToReflect

!RsrService class methodsFor!
clientClassName

!RsrDeliverResponse class methodsFor!
transaction: aTransactionId

!RsrDeliverResponse class methodsFor!
transaction: aTransactionId

!RsrBufferedSocketStream class methodsFor!
on: aSocketStream

!RsrRetainObject class methodsFor!
object: anRsrObject

!RsrRetainObject class methodsFor!
object: anRsrObject

!RsrDecoder class methodsFor!
registry: anRsrRegistry

!RsrCycleDetected class methodsFor!
signal: anObject

!RsrRetainAnalysis class methodsFor!
roots: anArray

!RsrSendMessage class methodsFor!
transaction: aTransactionId

!RsrEventLoop class methodsFor!
on: aConnection

!RsrReleaseObjects class methodsFor!
oids: anArray

!RsrAbstractServiceFactory class methodsFor!
clientClassName

!RsrAbstractServiceFactory class methodsFor!
serverClassName

!RsrConnection class methodsFor!
socket: aSocket

!RsrConnection class methodsFor!
new

!RsrConnection class methodsFor!
connectTo: aPortNumber

!RsrConnection class methodsFor!
acceptOn: aPortNumber

!RsrConnection class methodsFor!
connectionTimeout

!RsrLogWithPrefix class methodsFor!
prefix: aString

!RsrLogWithPrefix class methodsFor!
log: aLog

!RsrSocketStream class methodsFor!
on: anRsrSocket

!RsrStream class methodsFor!
on: aStream

!RsrNumericSpigot class methodsFor!
new

!RsrNumericSpigot class methodsFor!
naturals

!RsrNumericSpigot class methodsFor!
start: aNumber

!RsrPromise methodsFor!
value

!RsrPromise methodsFor!
waitForFulfillment

!RsrPromise methodsFor!
error: anException

!RsrPromise methodsFor!
initialize

!RsrPromise methodsFor!
isFulfilled

!RsrPromise methodsFor!
fulfill: anObject

!RsrDispatchEventLoop methodsFor!
initialize

!RsrDispatchEventLoop methodsFor!
stopToken

!RsrDispatchEventLoop methodsFor!
priority

!RsrDispatchEventLoop methodsFor!
stop

!RsrDispatchEventLoop methodsFor!
dispatch: aCommand

!RsrDispatchEventLoop methodsFor!
executeCycle

!RsrDeliverResponse methodsFor!
response

!RsrDeliverResponse methodsFor!
writeUsing: aCommandWriter

!RsrDeliverResponse methodsFor!
errorName: aSymbol

!RsrDeliverResponse methodsFor!
executeFor: aConnection

!RsrDeliverResponse methodsFor!
encodeUsing: anRsrEncoder

!RsrDeliverResponse methodsFor!
response: anObject

!RsrDeliverResponse methodsFor!
isError

!RsrDeliverResponse methodsFor!
errorName

!RsrDeliverResponse methodsFor!
transaction

!RsrDeliverResponse methodsFor!
reportOn: aLog

!RsrDeliverResponse methodsFor!
sendOver: aConnection

!RsrDeliverResponse methodsFor!
error

!RsrDeliverResponse methodsFor!
transaction: aTransactionId

!RsrServiceFactory methodsFor!
mirror: aService

!RsrServiceFactory methodsFor!
serviceFor: aResponsibility

!RsrEncoder methodsFor!
encodeObject: anObject

!RsrEncoder methodsFor!
isService: anObject

!RsrEncoder methodsFor!
speciesMapping

!RsrEncoder methodsFor!
encodeControlWord: anInteger

!RsrEncoder methodsFor!
encodeRetainObject: aRetainObject

!RsrEncoder methodsFor!
encodeReferenceOf: anObject

!RsrEncoder methodsFor!
retainObjectIdentifier

!RsrEncoder methodsFor!
speciesOf: anObject

!RsrEncoder methodsFor!
encodeDeliverResponse: aDeliverResponse

!RsrEncoder methodsFor!
encodeSendMessage: aSendMessage

!RsrEncoder methodsFor!
sendMessageIdentifier

!RsrEncoder methodsFor!
encodeObject: anObject

!RsrEncoder methodsFor!
encodeReleaseObjects: aReleaseObject

!RsrEncoder methodsFor!
isImmediate: anObject

!RsrEncoder methodsFor!
integerAsByteArray: anInteger

!RsrCommandSink methodsFor!
write: aByteArray

!RsrCommandSink methodsFor!
writeCommand: aCommand

!RsrCommandSink methodsFor!
flush

!RsrCommandSink methodsFor!
initialize

!RsrCommandSink methodsFor!
enqueue: aCommand

!RsrCommandSink methodsFor!
stop

!RsrCommandSink methodsFor!
stopToken

!RsrCommandSink methodsFor!
executeCycle

!RsrReleaseObjects methodsFor!
reportOn: aLog

!RsrReleaseObjects methodsFor!
executeFor: aConnection

!RsrReleaseObjects methodsFor!
oids

!RsrReleaseObjects methodsFor!
encodeUsing: anRsrEncoder

!RsrReleaseObjects methodsFor!
oids: anArray

!RsrService methodsFor!
_reflectedVariablesDo: aBlock

!RsrService methodsFor!
isClient

!RsrService methodsFor!
_id

!RsrService methodsFor!
_reflectedVariableIndecesDo: aBlock

!RsrService methodsFor!
_id: anRsrId

!RsrService methodsFor!
_addTo: aRegistry

!RsrService methodsFor!
isMirrored

!RsrService methodsFor!
_synchronize

!RsrService methodsFor!
_variablesToReflect

!RsrService methodsFor!
remoteServiceName

!RsrService methodsFor!
serviceName

!RsrService methodsFor!
isServer

!RsrService methodsFor!
_connection

!RsrService methodsFor!
synchronize

!RsrService methodsFor!
isNotMirrored

!RsrRetainObject methodsFor!
reportOn: aLog

!RsrRetainObject methodsFor!
executeFor: aConnection

!RsrRetainObject methodsFor!
= anEncodedObject

!RsrRetainObject methodsFor!
hash

!RsrRetainObject methodsFor!
object: anObject

!RsrRetainObject methodsFor!
encodeUsing: anRsrEncoder

!RsrRetainObject methodsFor!
object

!RsrRetainObject methodsFor!
writeUsing: aCommandWriter

!RsrMessageDispatcher methodsFor!
stop

!RsrMessageDispatcher methodsFor!
dispatch: aMessageSend

!RsrMessageDispatcher methodsFor!
executeCycle

!RsrSendMessage methodsFor!
receiver

!RsrSendMessage methodsFor!
writeUsing: aCommandWriter

!RsrSendMessage methodsFor!
arguments

!RsrSendMessage methodsFor!
encodeUsing: anEncoder

!RsrSendMessage methodsFor!
arguments: anObject

!RsrSendMessage methodsFor!
executeFor: aConnection

!RsrSendMessage methodsFor!
selector

!RsrSendMessage methodsFor!
transaction

!RsrSendMessage methodsFor!
selector: anObject

!RsrSendMessage methodsFor!
receiver: anObject

!RsrSendMessage methodsFor!
reportOn: aLog

!RsrSendMessage methodsFor!
roots

!RsrSendMessage methodsFor!
sendOver: aConnection

!RsrSendMessage methodsFor!
transaction: anObject

!RsrSendMessage methodsFor!
primExecuteFor: aConnection

!RsrServiceFactoryServer methodsFor!
return: aService

!RsrLogWithPrefix methodsFor!
prefix

!RsrLogWithPrefix methodsFor!
log

!RsrLogWithPrefix methodsFor!
log: aLog

!RsrLogWithPrefix methodsFor!
debug: aString

!RsrLogWithPrefix methodsFor!
prefix: aString

!RsrBufferedSocketStream methodsFor!
next

!RsrBufferedSocketStream methodsFor!
growOutBufferTo: aNumberOfBytes

!RsrBufferedSocketStream methodsFor!
close

!RsrBufferedSocketStream methodsFor!
flush

!RsrBufferedSocketStream methodsFor!
atEnd

!RsrBufferedSocketStream methodsFor!
initialize

!RsrBufferedSocketStream methodsFor!
isConnected

!RsrBufferedSocketStream methodsFor!
nextPutAll: aByteArray

!RsrBufferedSocketStream methodsFor!
stream: aStream

!RsrBufferedSocketStream methodsFor!
next: aCount

!RsrBufferedSocketStream methodsFor!
checkAutoFlush

!RsrObjectCache methodsFor!
initialize

!RsrObjectCache methodsFor!
add: anObject

!RsrObjectCache methodsFor!
reset

!RsrEventLoop methodsFor!
stop

!RsrEventLoop methodsFor!
log: aString

!RsrEventLoop methodsFor!
executeCycle

!RsrEventLoop methodsFor!
start

!RsrEventLoop methodsFor!
stoppedState

!RsrEventLoop methodsFor!
initialize

!RsrEventLoop methodsFor!
priority

!RsrEventLoop methodsFor!
connection: anObject

!RsrEventLoop methodsFor!
runningState

!RsrEventLoop methodsFor!
report: aCommand

!RsrEventLoop methodsFor!
runLoop

!RsrEventLoop methodsFor!
isActive

!RsrEventLoop methodsFor!
log

!RsrEventLoop methodsFor!
reportException: anException

!RsrEventLoop methodsFor!
connection

!RsrEventLoop methodsFor!
stream

!RsrStream methodsFor!
nextPutAll: aByteArray

!RsrStream methodsFor!
close

!RsrStream methodsFor!
next

!RsrStream methodsFor!
next: aLength

!RsrStream methodsFor!
flush

!RsrStream methodsFor!
binary

!RsrStream methodsFor!
stream: aStream

!RsrCycleDetected methodsFor!
messageText

!RsrCycleDetected methodsFor!
object: anObject

!RsrLog methodsFor!
levelError

!RsrLog methodsFor!
levelInfo

!RsrLog methodsFor!
log: aString

!RsrLog methodsFor!
levelTrace

!RsrLog methodsFor!
debug: aString

!RsrLog methodsFor!
levelDebug

!RsrLog methodsFor!
log: aMessage

!RsrLog methodsFor!
verbosity

!RsrLog methodsFor!
warn: aString

!RsrLog methodsFor!
initialize

!RsrLog methodsFor!
verbosity: aLogLevel

!RsrLog methodsFor!
info: aString

!RsrLog methodsFor!
levelWarn

!RsrLog methodsFor!
trace: aString

!RsrLog methodsFor!
error: aString

!RsrRetainAnalysis methodsFor!
roots: anObject

!RsrRetainAnalysis methodsFor!
initialize

!RsrRetainAnalysis methodsFor!
perform

!RsrRetainAnalysis methodsFor!
analyze: anObject

!RsrRetainAnalysis methodsFor!
nextOid

!RsrRetainAnalysis methodsFor!
registry

!RsrRetainAnalysis methodsFor!
analyzing: anObject

!RsrRetainAnalysis methodsFor!
retainCommands

!RsrRetainAnalysis methodsFor!
ensureRegistered: anRsrObject

!RsrRetainAnalysis methodsFor!
analyzeImmediate: anObject

!RsrRetainAnalysis methodsFor!
encoder

!RsrRetainAnalysis methodsFor!
connection: aConnection

!RsrRetainAnalysis methodsFor!
speciesOf: anObject

!RsrRetainAnalysis methodsFor!
roots

!RsrRetainAnalysis methodsFor!
analyzeDictionary: aDictionary

!RsrRetainAnalysis methodsFor!
analyzeService: aService

!RsrRetainAnalysis methodsFor!
analyzeCollection: aCollection

!RsrRetainAnalysis methodsFor!
connection

!RsrRetainAnalysis methodsFor!
retain: aService

!RsrCommandSource methodsFor!
decoder

!RsrCommandSource methodsFor!
nextCommand

!RsrCommandSource methodsFor!
dispatcher

!RsrCommandSource methodsFor!
executeCycle

!RsrConnection methodsFor!
serviceFor: aResponsibility

!RsrConnection methodsFor!
close

!RsrConnection methodsFor!
log

!RsrConnection methodsFor!
decoder

!RsrConnection methodsFor!
initialize

!RsrConnection methodsFor!
transactionSpigot

!RsrConnection methodsFor!
stream

!RsrConnection methodsFor!
oidSpigot

!RsrConnection methodsFor!
isClosed

!RsrConnection methodsFor!
objectCache

!RsrConnection methodsFor!
oidSpigot: anIntegerSpigot

!RsrConnection methodsFor!
disconnected

!RsrConnection methodsFor!
commandReader

!RsrConnection methodsFor!
newTransactionId

!RsrConnection methodsFor!
commandWriter

!RsrConnection methodsFor!
_sendMessage: aMessage

!RsrConnection methodsFor!
promises

!RsrConnection methodsFor!
dispatcher

!RsrConnection methodsFor!
registry

!RsrConnection methodsFor!
unknownError: anException

!RsrConnection methodsFor!
encoder

!RsrConnection methodsFor!
releaseOid: anOid

!RsrConnection methodsFor!
_forwarderClass

!RsrConnection methodsFor!
open

!RsrConnection methodsFor!
transactionSpigot: anObject

!RsrConnection methodsFor!
isOpen

!RsrConnection methodsFor!
socket: aSocket

!RsrThreadSafeNumericSpigot methodsFor!
initialize

!RsrThreadSafeNumericSpigot methodsFor!
next

!RsrCodec methodsFor!
sizeOfInteger

!RsrCodec methodsFor!
deliverResponseCommand

!RsrCodec methodsFor!
controlWordMin

!RsrCodec methodsFor!
controlWordMax

!RsrCodec methodsFor!
immediateOID

!RsrCodec methodsFor!
releaseObjectsCommand

!RsrCodec methodsFor!
sendMessageCommand

!RsrCodec methodsFor!
retainObjectCommand

!RsrDecoder methodsFor!
decodeService: aStream

!RsrDecoder methodsFor!
initializeDecodeCommandMap

!RsrDecoder methodsFor!
lookupClass: aClassName

!RsrDecoder methodsFor!
decodeControlWord: aStream

!RsrDecoder methodsFor!
registry: anRsrRegistry

!RsrDecoder methodsFor!
decodeReleaseObjects: aStream

!RsrDecoder methodsFor!
registry

!RsrDecoder methodsFor!
signalUnknownOID

!RsrDecoder methodsFor!
decodeImmediateObject: aStream

!RsrDecoder methodsFor!
decodeDeliverResponse: aStream

!RsrDecoder methodsFor!
connection: aConnection

!RsrDecoder methodsFor!
decodeObjectReference: aStream

!RsrDecoder methodsFor!
decodeSendMessage: aStream

!RsrDecoder methodsFor!
decodeCommandMap

!RsrDecoder methodsFor!
decodeCommand: aStream

!RsrDecoder methodsFor!
bytesAsInteger: bytes

!RsrDecoder methodsFor!
connection

!RsrDecoder methodsFor!
decodeRetainObject: aStream

!RsrSocketStream methodsFor!
isConnected

!RsrSocketStream methodsFor!
socket: anRsrSocket

!RsrSocketStream methodsFor!
nextPutAll: bytes

!RsrSocketStream methodsFor!
close

!RsrSocketStream methodsFor!
next

!RsrSocketStream methodsFor!
flush

!RsrSocketStream methodsFor!
next: aCount

!RsrSocketStream methodsFor!
atEnd

!RsrCommand methodsFor!
reportOn: aLog

!RsrCommand methodsFor!
encoding

!RsrCommand methodsFor!
executeFor: aConnection

!RsrCommand methodsFor!
sendOver: aConnection

!RsrCommand methodsFor!
writeUsing: aCommandWriter

!RsrCommand methodsFor!
encodeUsing: anRsrEncoder

!RsrCommand methodsFor!
encoding: anObject

!RsrNumericSpigot methodsFor!
step: anIncrement

!RsrNumericSpigot methodsFor!
step

!RsrNumericSpigot methodsFor!
next

!RsrNumericSpigot methodsFor!
next: aCount

!RsrNumericSpigot methodsFor!
negated

!RsrNumericSpigot methodsFor!
start: aNumber