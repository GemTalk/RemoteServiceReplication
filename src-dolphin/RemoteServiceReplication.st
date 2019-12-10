RsrProtoObject
	subclass: #RsrForwarder
	instanceVariableNames: 'rsrObject'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrForwarder categoriesForClass!RemoteServiceReplication-Utilities! !

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
	subclass: #RsrCommandProcessor
	instanceVariableNames: 'process connection state'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCommandProcessor categoriesForClass!RemoteServiceReplication-Communications! !

RsrObject
	subclass: #RsrConnection
	instanceVariableNames: 'isOpen transactionSpigot commandWriter commandReader registry objectCache socket stream promises dispatcher oidSpigot serviceFactory log'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrConnection categoriesForClass!RemoteServiceReplication-Communications! !

RsrObject
	subclass: #RsrLog
	instanceVariableNames: 'verbosity'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrLog categoriesForClass!RemoteServiceReplication-Debugging! !

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
	instanceVariableNames: 'rsrId rsrConnection remoteSelf'
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

RsrCommandProcessor
	subclass: #RsrCommandDispatcher
	instanceVariableNames: 'queue'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCommandDispatcher categoriesForClass!RemoteServiceReplication-Communications! !

RsrCommandProcessor
	subclass: #RsrCommandReader
	instanceVariableNames: 'decoder'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCommandReader categoriesForClass!RemoteServiceReplication-Communications! !

RsrCommandProcessor
	subclass: #RsrCommandWriter
	instanceVariableNames: 'queue'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCommandWriter categoriesForClass!RemoteServiceReplication-Communications! !

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCycleDetected categoriesForClass!RemoteServiceReplication-Exceptions! !

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

!RsrService class methodsFor!
_id: anId

!RsrService class methodsFor!
clientClass

!RsrService class methodsFor!
serverClass

!RsrService class methodsFor!
isClientClass

!RsrService class methodsFor!
isServerClass

!RsrService class methodsFor!
variablesToReflect

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

!RsrRetainAnalysis class methodsFor!
roots: anArray

!RsrSendMessage class methodsFor!
transaction: aTransactionId

!RsrForwarder class methodsFor!
on: anRsrObject

!RsrReleaseObjects class methodsFor!
oids: anArray

!RsrAbstractServiceFactory class methodsFor!
clientClass

!RsrAbstractServiceFactory class methodsFor!
serverClass

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

!RsrCommandProcessor class methodsFor!
on: aConnection

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

!RsrCommandReader methodsFor!
decoder

!RsrCommandReader methodsFor!
nextCommand

!RsrCommandReader methodsFor!
dispatcher

!RsrCommandReader methodsFor!
executeCycle

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

!RsrForwarder methodsFor!
doesNotUnderstand: aMessage

!RsrForwarder methodsFor!
_object: anRsrObject

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
transaction

!RsrDeliverResponse methodsFor!
errorName

!RsrDeliverResponse methodsFor!
sendOver: aConnection

!RsrDeliverResponse methodsFor!
error

!RsrDeliverResponse methodsFor!
transaction: aTransactionId

!RsrEncoder methodsFor!
encodeObject: anObject

!RsrEncoder methodsFor!
isService: anObject

!RsrEncoder methodsFor!
encodeRetainObject: aRetainObject

!RsrEncoder methodsFor!
encodeObject: anObject

!RsrEncoder methodsFor!
sendMessageIdentifier

!RsrEncoder methodsFor!
integerAsByteArray: anInteger

!RsrEncoder methodsFor!
encodeReferenceOf: anObject

!RsrEncoder methodsFor!
retainObjectIdentifier

!RsrEncoder methodsFor!
encodeControlWord: anInteger

!RsrEncoder methodsFor!
encodeSendMessage: aSendMessage

!RsrEncoder methodsFor!
encodeDeliverResponse: aDeliverResponse

!RsrEncoder methodsFor!
speciesOf: anObject

!RsrEncoder methodsFor!
speciesMapping

!RsrEncoder methodsFor!
encodeReleaseObjects: aReleaseObject

!RsrEncoder methodsFor!
isImmediate: anObject

!RsrServiceFactory methodsFor!
serviceFor: aResponsibility

!RsrServiceFactory methodsFor!
mirror: aService

!RsrReleaseObjects methodsFor!
encodeUsing: anRsrEncoder

!RsrReleaseObjects methodsFor!
executeFor: aConnection

!RsrReleaseObjects methodsFor!
oids

!RsrReleaseObjects methodsFor!
oids: anArray

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

!RsrService methodsFor!
synchronize

!RsrService methodsFor!
_id

!RsrService methodsFor!
isNotMirrored

!RsrService methodsFor!
remoteServiceName

!RsrService methodsFor!
isServer

!RsrService methodsFor!
isClient

!RsrService methodsFor!
variablesToReflect

!RsrService methodsFor!
remoteServiceClass

!RsrService methodsFor!
_synchronize

!RsrService methodsFor!
serviceName

!RsrService methodsFor!
_connection

!RsrService methodsFor!
_addTo: aRegistry

!RsrService methodsFor!
_id: anRsrId

!RsrService methodsFor!
isMirrored

!RsrService methodsFor!
_reflectedVariableIndecesDo: aBlock

!RsrService methodsFor!
_reflectedVariablesDo: aBlock

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
sendOver: aConnection

!RsrSendMessage methodsFor!
roots

!RsrSendMessage methodsFor!
transaction: anObject

!RsrServiceFactoryServer methodsFor!
return: aService

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
isImmediate: anObject

!RsrRetainAnalysis methodsFor!
perform

!RsrRetainAnalysis methodsFor!
initialize

!RsrRetainAnalysis methodsFor!
roots: anObject

!RsrRetainAnalysis methodsFor!
process: anObject

!RsrRetainAnalysis methodsFor!
nextOid

!RsrRetainAnalysis methodsFor!
isService: anObject

!RsrRetainAnalysis methodsFor!
registry

!RsrRetainAnalysis methodsFor!
processDictionary: aDictionary

!RsrRetainAnalysis methodsFor!
ensureRegistered: anRsrObject

!RsrRetainAnalysis methodsFor!
processCollection: aCollection

!RsrRetainAnalysis methodsFor!
retainCommands

!RsrRetainAnalysis methodsFor!
encoder

!RsrRetainAnalysis methodsFor!
isDictionary: anObject

!RsrRetainAnalysis methodsFor!
isCollection: anObject

!RsrRetainAnalysis methodsFor!
connection: aConnection

!RsrRetainAnalysis methodsFor!
roots

!RsrRetainAnalysis methodsFor!
connection

!RsrRetainAnalysis methodsFor!
processService: aService

!RsrRetainAnalysis methodsFor!
processing: anObject

!RsrRetainAnalysis methodsFor!
retain: anRsrObject

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
objectCache

!RsrConnection methodsFor!
oidSpigot: anIntegerSpigot

!RsrConnection methodsFor!
disconnected

!RsrConnection methodsFor!
promises

!RsrConnection methodsFor!
newTransactionId

!RsrConnection methodsFor!
commandWriter

!RsrConnection methodsFor!
commandReader

!RsrConnection methodsFor!
dispatcher

!RsrConnection methodsFor!
registry

!RsrConnection methodsFor!
_sendMessage: aMessage

!RsrConnection methodsFor!
unknownError: anException

!RsrConnection methodsFor!
encoder

!RsrConnection methodsFor!
releaseOid: anOid

!RsrConnection methodsFor!
_forwarderClass

!RsrConnection methodsFor!
transactionSpigot: anObject

!RsrConnection methodsFor!
open

!RsrConnection methodsFor!
isOpen

!RsrConnection methodsFor!
socket: aSocket

!RsrThreadSafeNumericSpigot methodsFor!
initialize

!RsrThreadSafeNumericSpigot methodsFor!
next

!RsrCommandWriter methodsFor!
write: aByteArray

!RsrCommandWriter methodsFor!
flush

!RsrCommandWriter methodsFor!
initialize

!RsrCommandWriter methodsFor!
enqueue: aCommand

!RsrCommandWriter methodsFor!
stopToken

!RsrCommandWriter methodsFor!
stop

!RsrCommandWriter methodsFor!
executeCycle

!RsrCodec methodsFor!
retainObjectCommand

!RsrCodec methodsFor!
deliverResponseCommand

!RsrCodec methodsFor!
controlWordMax

!RsrCodec methodsFor!
sizeOfInteger

!RsrCodec methodsFor!
sendMessageCommand

!RsrCodec methodsFor!
immediateOID

!RsrCodec methodsFor!
releaseObjectsCommand

!RsrCodec methodsFor!
controlWordMin

!RsrDecoder methodsFor!
bytesAsInteger: bytes

!RsrDecoder methodsFor!
decodeCommand: aStream

!RsrDecoder methodsFor!
signalUnknownOID

!RsrDecoder methodsFor!
decodeControlWord: aStream

!RsrDecoder methodsFor!
connection

!RsrDecoder methodsFor!
decodeReleaseObjects: aStream

!RsrDecoder methodsFor!
decodeSendMessage: aStream

!RsrDecoder methodsFor!
registry: anRsrRegistry

!RsrDecoder methodsFor!
decodeObjectReference: aStream

!RsrDecoder methodsFor!
registry

!RsrDecoder methodsFor!
lookupClass: aClassName

!RsrDecoder methodsFor!
initializeDecodeCommandMap

!RsrDecoder methodsFor!
decodeImmediateObject: aStream

!RsrDecoder methodsFor!
decodeService: aStream

!RsrDecoder methodsFor!
decodeRetainObject: aStream

!RsrDecoder methodsFor!
connection: aConnection

!RsrDecoder methodsFor!
decodeCommandMap

!RsrDecoder methodsFor!
decodeDeliverResponse: aStream

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
encoding

!RsrCommand methodsFor!
executeFor: aConnection

!RsrCommand methodsFor!
writeUsing: aCommandWriter

!RsrCommand methodsFor!
sendOver: aConnection

!RsrCommand methodsFor!
encodeUsing: anRsrEncoder

!RsrCommand methodsFor!
encoding: anObject

!RsrCommandDispatcher methodsFor!
initialize

!RsrCommandDispatcher methodsFor!
stopToken

!RsrCommandDispatcher methodsFor!
priority

!RsrCommandDispatcher methodsFor!
dispatch: aCommand

!RsrCommandDispatcher methodsFor!
stop

!RsrCommandDispatcher methodsFor!
executeCycle

!RsrCommandProcessor methodsFor!
stop

!RsrCommandProcessor methodsFor!
log: anException

!RsrCommandProcessor methodsFor!
executeCycle

!RsrCommandProcessor methodsFor!
start

!RsrCommandProcessor methodsFor!
stoppedState

!RsrCommandProcessor methodsFor!
initialize

!RsrCommandProcessor methodsFor!
priority

!RsrCommandProcessor methodsFor!
connection: anObject

!RsrCommandProcessor methodsFor!
runningState

!RsrCommandProcessor methodsFor!
runLoop

!RsrCommandProcessor methodsFor!
isActive

!RsrCommandProcessor methodsFor!
log

!RsrCommandProcessor methodsFor!
stream

!RsrCommandProcessor methodsFor!
connection