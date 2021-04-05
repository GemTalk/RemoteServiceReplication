| package |
package := Package name: 'RemoteServiceReplication'.
package paxVersion: 1; basicComment: ''.

package classNames
	add: #RsrThreadSafeNumericSpigot;
	add: #RsrTokenExchangeFailed;
	add: #RsrCodec;
	add: #RsrLog;
	add: #RsrStream;
	add: #RsrRemoteException;
	add: #RsrGciAcceptConnection;
	add: #RsrConnectionSpecification;
	add: #RsrHandshakeStep;
	add: #RsrProtocolVersionNegotiationMessage;
	add: #RsrSocketConnectionSpecification;
	add: #RsrProtocolVersionNegotiationCodec;
	add: #RsrTokenAccepted;
	add: #RsrLogWithPrefix;
	add: #RsrCommandSource;
	add: #RsrChannel;
	add: #RsrTokenExchange;
	add: #RsrRemotePromiseResolver;
	add: #RsrDeliverResponse;
	add: #RsrPendingMessage;
	add: #RsrRemoteError;
	add: #RsrCommandCodec;
	add: #RsrLogSink;
	add: #RsrSocketStream;
	add: #RsrRemoteExceptionClient;
	add: #RsrDecodingRaisedException;
	add: #RsrInternalConnectionSpecification;
	add: #RsrProtocolVersionNegotiation;
	add: #RsrChosenVersion;
	add: #RsrAcceptConnection;
	add: #RsrTokenRejected;
	add: #RsrTokenExchangeCodec;
	add: #RsrInitiateConnection;
	add: #RsrMessageSend;
	add: #RsrHandshakeError;
	add: #RsrBinaryStreamChannel;
	add: #RsrTokenReceiver;
	add: #RsrServiceSnapshot;
	add: #RsrSendMessage;
	add: #RsrInMemoryConnectionSpecification;
	add: #RsrPromise;
	add: #RsrPlatformInitializer;
	add: #RsrCommandDecoder;
	add: #RsrCustomSink;
	add: #RsrStreamChannelLoop;
	add: #RsrRemoteExceptionServer;
	add: #RsrGciInitiateConnection;
	add: #RsrService;
	add: #RsrProtocolVersionNegotiationClient;
	add: #RsrNoVersionOverlap;
	add: #RsrCommand;
	add: #RsrNumericSpigot;
	add: #RsrProtocolVersionNegotiationFailed;
	add: #RsrInMemoryChannel;
	add: #RsrTokenSender;
	add: #RsrSnapshotAnalysis;
	add: #RsrReleaseServices;
	add: #RsrInternalSocketConnectionSpecification;
	add: #RsrPromiseResolutionAction;
	add: #RsrCommandEncoder;
	add: #RsrTranscriptSink;
	add: #RsrCommandSink;
	add: #RsrBufferedSocketStream;
	add: #RsrReasonService;
	add: #RsrHandshake;
	add: #RsrProtocolVersionNegotiationServer;
	add: #RsrSupportedVersions;
	add: #RsrMessagingCommand;
	yourself.

package methodNames
	add: #RsrConnection -> #serviceAt:ifAbsent:;
	add: #RsrConnection -> #log;
	add: #RsrConnection -> #_releaseSID:;
	add: #RsrConnection -> #_remoteClientReleased:;
	add: #RsrConnection -> #mournActionForServerSID:;
	add: #RsrConnection -> #initialize;
	add: #RsrConnection -> #oidSpigot;
	add: #RsrConnection -> #channel:;
	add: #RsrConnection -> #_ensureRegistered:;
	add: #RsrConnection -> #oidSpigot:;
	add: #RsrConnection -> #_register:as:;
	add: #RsrConnection -> #transactionSpigot;
	add: #RsrConnection -> #serviceAt:;
	add: #RsrConnection -> #_sendMessage:to:;
	add: #RsrConnection -> #pendingMessages;
	add: #RsrConnection -> #_receivedCommand:;
	add: #RsrConnection -> #unknownError:;
	add: #RsrConnection -> #_sendCommand:;
	add: #RsrConnection -> #mournActionForClientSID:;
	add: #RsrConnection -> #channelDisconnected;
	add: #RsrConnection -> #_forwarderClass;
	add: #RsrConnection -> #transactionSpigot:;
	add: #RsrConnection -> #_stronglyRetain:;
	add: #RsrConnection -> #channel;
	add: #RsrForwarder -> #doesNotUnderstand:;
	add: #RsrForwarder -> #_service:;
	add: 'RsrReference class' -> #referenceClassFor:;
	add: 'RsrForwarder class' -> #on:;
	yourself.

package setPrerequisites: #('RemoteServiceReplication-Dolphin').

package!

Object
	subclass: #RsrPlatformInitializer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrPlatformInitializer comment: 'Does load-time initialization of any class instance variables of classes defined in Base but that have platform-specific contents and thus can''t be initialized by their own package, and can''t be lazily initialized because that fails on GemStone for non-privileged users.'!
!RsrPlatformInitializer categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrBufferedSocketStream
	instanceVariableNames: 'stream outBuffer writePosition nextToWrite'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrBufferedSocketStream categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrChannel
	instanceVariableNames: 'connection'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrChannel comment: 'No class-specific documentation for RsrChannel, hierarchy is:Object  RsrObject    RsrChannel'!
!RsrChannel categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrCodec
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCodec categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrCommand comment: 'No class-specific documentation for RsrCommand, hierarchy is:Object  RsrObject    RsrCommand( encoding)'!
!RsrCommand categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrConnectionSpecification
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrConnectionSpecification categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrHandshake
	instanceVariableNames: 'steps stream'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrHandshake categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrHandshakeStep
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrHandshakeStep categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrLog
	instanceVariableNames: 'verbosity sinks'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrLog categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrLogSink
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrLogSink categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrLogWithPrefix
	instanceVariableNames: 'prefix log'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrLogWithPrefix categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrMessageSend
	instanceVariableNames: 'receiver selector arguments'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMessageSend categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrNumericSpigot
	instanceVariableNames: 'current step'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrNumericSpigot categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrPendingMessage
	instanceVariableNames: 'services promise'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrPendingMessage categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrPromise
	instanceVariableNames: 'mutex value state resolvedMutex resolutionActions'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrPromise comment: 'Purpose: Provide a simple Promise interface for use in RSR.A Promise may be in two high level states -- unresolved and resolved. Resolving a promise means either breaking or fulfilling the promise. Any users of the Notification Interface will be notified of the resolution. See individual methods for details.Resolution Interface:- #break:- #fulfill:Notification Interface:- #when:catch:- #wait- #valueExample Usage:```	| promise |	promise := Promise new.	promise		when: [:anObject | Transcript show: ''Promise fulfilled to: '', anObject asString; cr]		catch: [:reason | Transcript show: ''Promise broken because of '', reason asString; cr].	"Time passes"	promise fulfill: Object new``````	| promise |	promise := Promise new.	self runAsynCalculationThenFulfill: promise.	promise wait.```'!
!RsrPromise categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrPromiseResolutionAction
	instanceVariableNames: 'when catch'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrPromiseResolutionAction categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrProtocolVersionNegotiationMessage
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrProtocolVersionNegotiationMessage comment: 'HandshakeMessage serves as a superclass for all Messages used while processing a Connection Handshake.'!
!RsrProtocolVersionNegotiationMessage categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrRemotePromiseResolver
	instanceVariableNames: 'mutex sendMessage connection extraRoots hasResolved'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrRemotePromiseResolver comment: 'This class is responsible for taking breaking or fulfilling its associated Promise. The Promise exists in the remote RSR instance.This class may be mutated outside of the thread which created it. Therefore, it contains a protection mutex to ensure consistency.'!
!RsrRemotePromiseResolver categoriesForClass!RemoteServiceReplication! !

RsrAbstractService
	subclass: #RsrService
	instanceVariableNames: '_id _connection remoteSelf'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrService comment: 'I represent a class of Objects that know offer Rsr Services.'!
!RsrService categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrServiceSnapshot
	instanceVariableNames: 'sid targetClassName slots'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrServiceSnapshot comment: 'RsrServiceSnapshotWhen a SendMessage or DeliverResponse command is processed, the entire transition closure of the MessageSend/Response is analyzed.A Snapshot of each Service found during this process is taken. The slots of the Service that need to be replicated are stored in the ServiceSnapshot as references.In addition, information about the template and service is stored. This allows the peer to reify the correct type of Service. For instance, a local Client will be a Server remotely. A local Server will become a remote Client.Collaborators:- Encoder- Decoder- Reference'!
!RsrServiceSnapshot categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrSnapshotAnalysis
	instanceVariableNames: 'roots snapshots connection analyzedObjects'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrSnapshotAnalysis comment: 'No class-specific documentation for RsrSnapshotAnalysis, hierarchy is:Object  RsrObject    RsrSnapshotAnalysis( roots snapshots inFlight connection)'!
!RsrSnapshotAnalysis categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrStream
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrStream categoriesForClass!RemoteServiceReplication! !

RsrObject
	subclass: #RsrStreamChannelLoop
	instanceVariableNames: 'process channel state'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrStreamChannelLoop comment: 'No class-specific documentation for RsrEventLoop, hierarchy is:Object  RsrObject    RsrEventLoop( process connection state)'!
!RsrStreamChannelLoop categoriesForClass!RemoteServiceReplication! !

RsrChannel
	subclass: #RsrBinaryStreamChannel
	instanceVariableNames: 'sink source inStream outStream'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrBinaryStreamChannel comment: 'No class-specific documentation for RsrSocketChannel, hierarchy is:Object  RsrObject    RsrChannel      RsrSocketChannel( reader writer socket stream)'!
!RsrBinaryStreamChannel categoriesForClass!RemoteServiceReplication! !

RsrProtocolVersionNegotiationMessage
	subclass: #RsrChosenVersion
	instanceVariableNames: 'version'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrChosenVersion comment: 'This message is sent when a Server has chosen a version it is willing to talk w/ a client Connection. The Server expects the Client to speak this version.'!
!RsrChosenVersion categoriesForClass!RemoteServiceReplication! !

RsrCodec
	subclass: #RsrCommandCodec
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCommandCodec categoriesForClass!RemoteServiceReplication! !

RsrStreamChannelLoop
	subclass: #RsrCommandSink
	instanceVariableNames: 'queue'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrCommandSink comment: 'No class-specific documentation for RsrCommandSink, hierarchy is:Object  RsrObject    RsrEventLoop( process connection state)      RsrCommandSink( queue)'!
!RsrCommandSink categoriesForClass!RemoteServiceReplication! !

RsrStreamChannelLoop
	subclass: #RsrCommandSource
	instanceVariableNames: 'decoder'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCommandSource categoriesForClass!RemoteServiceReplication! !

RsrLogSink
	subclass: #RsrCustomSink
	instanceVariableNames: 'action'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCustomSink categoriesForClass!RemoteServiceReplication! !

RsrAbstractReason
	subclass: #RsrDecodingRaisedException
	instanceVariableNames: 'exception'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrDecodingRaisedException categoriesForClass!RemoteServiceReplication! !

RsrChannel
	subclass: #RsrInMemoryChannel
	instanceVariableNames: 'inQueue outQueue drainProcess'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrInMemoryChannel comment: 'Example usage:	| aQueue bQueue channelA channelB |	aQueue := SharedQueue new.	bQueue := SharedQueue new.	channelA := RsrInMemoryChannel		inQueue: aQueue		outQueue: bQueue.	channelB := RsrInMemoryChannel		inQueue: bQueue		outQueue: aQueue.	connectionA := RsrConnection		channel: channelA		transactionSpigot: RsrThreadSafeNumericSpigot naturals		oidSpigot: RsrThreadSafeNumericSpigot naturals.	connectionB := RsrConnection		channel: channelB		transactionSpigot: RsrThreadSafeNumericSpigot naturals negated		oidSpigot: RsrThreadSafeNumericSpigot naturals negated.	connectionA open.	connectionB open.'!
!RsrInMemoryChannel categoriesForClass!RemoteServiceReplication! !

RsrConnectionSpecification
	subclass: #RsrInternalConnectionSpecification
	instanceVariableNames: 'connectionA connectionB'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrInternalConnectionSpecification categoriesForClass!RemoteServiceReplication! !

RsrCommand
	subclass: #RsrMessagingCommand
	instanceVariableNames: 'snapshots transaction'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrMessagingCommand categoriesForClass!RemoteServiceReplication! !

RsrProtocolVersionNegotiationMessage
	subclass: #RsrNoVersionOverlap
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrNoVersionOverlap comment: 'This message is sent when a Server has determined it cannot talk any version of the protocol that the Client has requested to speak.'!
!RsrNoVersionOverlap categoriesForClass!RemoteServiceReplication! !

RsrHandshakeStep
	subclass: #RsrProtocolVersionNegotiation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrProtocolVersionNegotiation comment: 'This class serves as the abstract superclass for the classes which implement the actual handshake protocol.When the Client opens a Socket to the Server, it is responsible for sending the first message.Client -> Server: SupportedVersionsServer -> Client:	alt: The Server and Client have overlap in their supported versions		- Server -> Client: ChosenVersion	alt: No overlap exists between the Client and Server.		- Server -> Client: NoVersionOverlap		- Server: Closes socket'!
!RsrProtocolVersionNegotiation categoriesForClass!RemoteServiceReplication! !

RsrCodec
	subclass: #RsrProtocolVersionNegotiationCodec
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrProtocolVersionNegotiationCodec categoriesForClass!RemoteServiceReplication! !

RsrService
	subclass: #RsrReasonService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrReasonService comment: 'This Service services as an abstract superclass for various Promise break reasons that must support replication.'!
!RsrReasonService categoriesForClass!RemoteServiceReplication! !

RsrCommand
	subclass: #RsrReleaseServices
	instanceVariableNames: 'sids'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrReleaseServices comment: 'No class-specific documentation for RsrReleaseServices, hierarchy is:Object  RsrObject    RsrCommand( encoding)      RsrReleaseServices( oids)'!
!RsrReleaseServices categoriesForClass!RemoteServiceReplication! !

RsrConnectionSpecification
	subclass: #RsrSocketConnectionSpecification
	instanceVariableNames: 'host port'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrSocketConnectionSpecification comment: 'This class is abstract and defines the interface for manufacturing RsrConnection instances which are connected to a peer.Specialized subclasses are reponsible for either listening for or initiating connections with a peer.'!
!RsrSocketConnectionSpecification categoriesForClass!RemoteServiceReplication! !

RsrStream
	subclass: #RsrSocketStream
	instanceVariableNames: 'socket'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrSocketStream categoriesForClass!RemoteServiceReplication! !

RsrProtocolVersionNegotiationMessage
	subclass: #RsrSupportedVersions
	instanceVariableNames: 'versions'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrSupportedVersions comment: 'When a Client connects to a Server. It is required to send this message w/ the list of supported protocol versions it is willing to speak. The preference of the client is signified by the order of the version numbers in <versions>.'!
!RsrSupportedVersions categoriesForClass!RemoteServiceReplication! !

RsrNumericSpigot
	subclass: #RsrThreadSafeNumericSpigot
	instanceVariableNames: 'mutex'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrThreadSafeNumericSpigot categoriesForClass!RemoteServiceReplication! !

RsrTokenExchangeMessage
	subclass: #RsrTokenAccepted
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTokenAccepted categoriesForClass!RemoteServiceReplication! !

RsrHandshakeStep
	subclass: #RsrTokenExchange
	instanceVariableNames: 'token'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTokenExchange categoriesForClass!RemoteServiceReplication! !

RsrCodec
	subclass: #RsrTokenExchangeCodec
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTokenExchangeCodec categoriesForClass!RemoteServiceReplication! !

RsrTokenExchangeMessage
	subclass: #RsrTokenRejected
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTokenRejected categoriesForClass!RemoteServiceReplication! !

RsrLogSink
	subclass: #RsrTranscriptSink
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTranscriptSink categoriesForClass!RemoteServiceReplication! !

RsrSocketConnectionSpecification
	subclass: #RsrAcceptConnection
	instanceVariableNames: 'listener isListening isWaitingForConnection'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrAcceptConnection categoriesForClass!RemoteServiceReplication! !

RsrCommandCodec
	subclass: #RsrCommandDecoder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrCommandDecoder comment: 'No class-specific documentation for RsrDecoder, hierarchy is:Object  RsrObject    RsrCodec      RsrDecoder( registry connection decodeCommandMap)'!
!RsrCommandDecoder categoriesForClass!RemoteServiceReplication! !

RsrCommandCodec
	subclass: #RsrCommandEncoder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCommandEncoder categoriesForClass!RemoteServiceReplication! !

RsrMessagingCommand
	subclass: #RsrDeliverResponse
	instanceVariableNames: 'responseReference'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrDeliverResponse comment: 'No class-specific documentation for RsrDeliverResponse, hierarchy is:Object  RsrObject    RsrCommand( encoding)      RsrDeliverResponse( transaction response roots retainList)'!
!RsrDeliverResponse categoriesForClass!RemoteServiceReplication! !

RsrError
	subclass: #RsrHandshakeError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrHandshakeError categoriesForClass!RemoteServiceReplication! !

RsrInternalConnectionSpecification
	subclass: #RsrInMemoryConnectionSpecification
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrInMemoryConnectionSpecification categoriesForClass!RemoteServiceReplication! !

RsrSocketConnectionSpecification
	subclass: #RsrInitiateConnection
	instanceVariableNames: 'token'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrInitiateConnection comment: 'This class is responsible for initating a new RsrConnection. Sending #connect will result in an attempt to connect to the specified host and port. #connect is responsible for initating the attempted connection. If successful, an instance of RsrConnection is returned as a result.Example: | initiator |initiator := RsrInitiateConnection	host: ''127.0.0.1''	port: 51820.^initiator connect'!
!RsrInitiateConnection categoriesForClass!RemoteServiceReplication! !

RsrInternalConnectionSpecification
	subclass: #RsrInternalSocketConnectionSpecification
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrInternalSocketConnectionSpecification categoriesForClass!RemoteServiceReplication! !

RsrProtocolVersionNegotiation
	subclass: #RsrProtocolVersionNegotiationClient
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrProtocolVersionNegotiationClient categoriesForClass!RemoteServiceReplication! !

RsrProtocolVersionNegotiation
	subclass: #RsrProtocolVersionNegotiationServer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrProtocolVersionNegotiationServer categoriesForClass!RemoteServiceReplication! !

RsrError
	subclass: #RsrRemoteError
	instanceVariableNames: 'originalClassName stack'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrRemoteError categoriesForClass!RemoteServiceReplication! !

RsrReasonService
	subclass: #RsrRemoteException
	instanceVariableNames: 'exceptionClassName tag messageText stack'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrRemoteException categoriesForClass!RemoteServiceReplication! !

RsrMessagingCommand
	subclass: #RsrSendMessage
	instanceVariableNames: 'receiverReference selectorReference argumentReferences'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrSendMessage comment: 'No class-specific documentation for RsrSendMessage, hierarchy is:Object  RsrObject    RsrCommand( encoding)      RsrSendMessage( transaction receiver selector arguments retainList)'!
!RsrSendMessage categoriesForClass!RemoteServiceReplication! !

RsrTokenExchange
	subclass: #RsrTokenReceiver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTokenReceiver categoriesForClass!RemoteServiceReplication! !

RsrTokenExchange
	subclass: #RsrTokenSender
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTokenSender categoriesForClass!RemoteServiceReplication! !

RsrAcceptConnection
	subclass: #RsrGciAcceptConnection
	instanceVariableNames: 'token'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrGciAcceptConnection categoriesForClass!RemoteServiceReplication! !

RsrInitiateConnection
	subclass: #RsrGciInitiateConnection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrGciInitiateConnection categoriesForClass!RemoteServiceReplication! !

RsrHandshakeError
	subclass: #RsrProtocolVersionNegotiationFailed
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrProtocolVersionNegotiationFailed categoriesForClass!RemoteServiceReplication! !

RsrRemoteException
	subclass: #RsrRemoteExceptionClient
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrRemoteExceptionClient categoriesForClass!RemoteServiceReplication! !

RsrRemoteException
	subclass: #RsrRemoteExceptionServer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrRemoteExceptionServer categoriesForClass!RemoteServiceReplication! !

RsrHandshakeError
	subclass: #RsrTokenExchangeFailed
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTokenExchangeFailed categoriesForClass!RemoteServiceReplication! !

!RsrReference class methodsFor!
referenceClassFor: anObject	(anObject isKindOf: RsrService)		ifTrue: [^RsrServiceReference].	^self referenceMapping		at: anObject class		ifAbsent: [RsrUnsupportedObject signal: anObject]! !

!RsrForwarder class methodsFor!
on: anRsrObject	| instance |	instance := self new.	instance _service: anRsrObject.	^instance! !

!RsrConnection methodsFor!
serviceAt: aSIDifAbsent: aBlock	"Return the service associated with the provided SID."	| entry |	entry := registry at: aSID ifAbsent: [nil].	"Ensure we do not hold the lock for long."	entry == nil		ifTrue: [^aBlock value].	"The Service may have been garbage collected but	the entry may not yet be removed. Ensure we	evaluate the block in that case as well."	^entry service		ifNil: aBlock		ifNotNil: [:service | service]! !

!RsrConnection methodsFor!
log	^log! !

!RsrConnection methodsFor!
_releaseSID: aSID	| command |	self isOpen		ifFalse: [^self].	self log trace: 'Cleaning up OID:', aSID printString.	command := RsrReleaseServices sids: (Array with: aSID).	self _sendCommand: command! !

!RsrConnection methodsFor!
_remoteClientReleased: aSID	"Remotely, a Client instance has been garbage collected.	Ensure we only reference the associated service weakly."	| entry |	entry := registry		at: aSID		ifAbsent: [^self].	entry becomeWeak.! !

!RsrConnection methodsFor!
mournActionForServerSID: aSID	^[registry removeKey: aSID]! !

!RsrConnection methodsFor!
initialize	super initialize.	transactionSpigot := RsrThreadSafeNumericSpigot naturals.	pendingMessages := RsrThreadSafeDictionary new.	registry := RsrThreadSafeDictionary new.	log := RsrLog new.	announcer := Announcer new! !

!RsrConnection methodsFor!
oidSpigot	^oidSpigot! !

!RsrConnection methodsFor!
channel: aChannel	channel := aChannel.	channel connection: self! !

!RsrConnection methodsFor!
_ensureRegistered: aService	aService _connection == nil		ifTrue: [^self _register: aService as: oidSpigot next].	aService _connection == self		ifFalse: [^RsrAlreadyRegistered signalService: aService intendedConnection: self]! !

!RsrConnection methodsFor!
oidSpigot: anIntegerSpigot	oidSpigot := anIntegerSpigot! !

!RsrConnection methodsFor!
_register: aServiceas: sid	| registryEntry mournAction |	aService		_id: sid		connection: self.	mournAction := aService isClient		ifTrue: [self mournActionForClientSID: sid]		ifFalse: [self mournActionForServerSID: sid].	registryEntry := RsrRegistryEntry		service: aService		onMourn: mournAction.	registry		at: sid		put: registryEntry! !

!RsrConnection methodsFor!
transactionSpigot	^transactionSpigot! !

!RsrConnection methodsFor!
serviceAt: aSID	^self		serviceAt: aSID		ifAbsent: [RsrUnknownSID signal: aSID printString]! !

!RsrConnection methodsFor!
_sendMessage: aMessageto: aService"Open coordination window"	"Send dirty transitive closure of aRemoteMessage"	"Send DispatchMessage command""Coorination window closed"	"Return Promise"	| analysis receiverReference selectorReference argumentReferences dispatchCommand promise pendingMessage |	self isOpen		ifFalse: [self error: 'Connection is not open'].	analysis := RsrSnapshotAnalysis		roots: (Array with: aService), aMessage arguments		connection: self.	analysis perform.	receiverReference := RsrReference from: aService.	selectorReference := RsrReference from: aMessage selector.	argumentReferences := aMessage arguments collect: [:each | RsrReference from: each].	dispatchCommand := RsrSendMessage		transaction: self transactionSpigot next		receiverReference: receiverReference		selectorReference: selectorReference		argumentReferences: argumentReferences.	dispatchCommand snapshots: analysis snapshots.	promise := RsrPromise new.	pendingMessage := RsrPendingMessage		services: nil "I don't think we need to cache services here. They will remain on the stack unless they were removed from the transitive closure by another proc"		promise: promise.	self pendingMessages		at: dispatchCommand transaction		put: pendingMessage.	self _sendCommand: dispatchCommand.	^promise! !

!RsrConnection methodsFor!
pendingMessages	^pendingMessages! !

!RsrConnection methodsFor!
_receivedCommand: aCommand	"Execute the command in the context of the receiving Connection."	RsrProcessModel		fork:			[RsrProcessModel configureFrameworkProcess.			aCommand executeFor: self]		named: 'Processing ', aCommand class name! !

!RsrConnection methodsFor!
unknownError: anException	self close! !

!RsrConnection methodsFor!
_sendCommand: aCommand	"Send the provided Command to our peer."	channel send: aCommand! !

!RsrConnection methodsFor!
mournActionForClientSID: aSID	^[registry removeKey: aSID.			self _releaseSID: aSID]! !

!RsrConnection methodsFor!
channelDisconnected	self log info: 'Disconnected'.	self close! !

!RsrConnection methodsFor!
_forwarderClass	^RsrForwarder! !

!RsrConnection methodsFor!
transactionSpigot: anObject	transactionSpigot := anObject! !

!RsrConnection methodsFor!
_stronglyRetain: aServer	"Retain the already registered server strongly."	| entry |	entry := registry		at: aServer _id		ifAbsent: [RsrUnknownSID signal: aServer _id printString].	entry becomeStrong! !

!RsrConnection methodsFor!
channel	^channel! !

!RsrForwarder methodsFor!
doesNotUnderstand: aMessage	^_service _connection		_sendMessage: aMessage		to: _service! !

!RsrForwarder methodsFor!
_service: aService	_service := aService! !

!RsrNumericSpigot class methodsFor!
new	^self		start: 0		step: 1! !

!RsrNumericSpigot class methodsFor!
naturals	^self		start: 1		step: 1! !

!RsrNumericSpigot class methodsFor!
start: aNumberstep: anIncrement	^super new		start: aNumber;		step: anIncrement;		yourself! !

!RsrPlatformInitializer class methodsFor!
initialize	RsrReference initializeReferenceMapping! !

!RsrRemoteError class methodsFor!
from: anException	| tag |	tag := anException tag		ifNotNil:			[[anException tag asString]				on: Error				do: [:ex | ex return: 'Unable to pack #tag containing an instance of ', anException tag class name]].	^self new		originalClassName: anException class name;		tag: tag;		messageText: anException messageText;		stack: RsrProcessModel currentStackDump;		yourself! !

!RsrDeliverResponse class methodsFor!
transaction: aTransactionIdresponseReference: aReferencesnapshots: anArrayOfSnapshots	^self new		transaction: aTransactionId;		responseReference: aReference;		snapshots: anArrayOfSnapshots;		yourself! !

!RsrGciInitiateConnection class methodsFor!
host: hostnameOrAddressport: porttoken: aToken	^self new		host: hostnameOrAddress;		port: port;		token: aToken;		yourself! !

!RsrService class methodsFor!
clientClassName	^(self templateClassName, 'Client') asSymbol! !

!RsrService class methodsFor!
isTemplateClass	^self name == self templateClassName! !

!RsrService class methodsFor!
_id: anIdconnection: aConnection	^super new		_id: anId connection: aConnection;		yourself! !

!RsrService class methodsFor!
isServerClass	^self name == self serverClassName! !

!RsrService class methodsFor!
isClientClass	^self name == self clientClassName! !

!RsrService class methodsFor!
serverClass	^RsrClassResolver classNamed: self serverClassName! !

!RsrService class methodsFor!
clientClass	^RsrClassResolver classNamed: self clientClassName! !

!RsrService class methodsFor!
serverClassName	^(self templateClassName, 'Server') asSymbol! !

!RsrService class methodsFor!
templateClass	^RsrClassResolver classNamed: self templateClassName! !

!RsrService class methodsFor!
templateClassName	self subclassResponsibility! !

!RsrServiceSnapshot class methodsFor!
reflectedVariablesFor: aServicedo: aBlock	self		reflectedVariableIndicesFor: aService		do: [:index | aBlock value: (aService instVarAt: index)]! !

!RsrServiceSnapshot class methodsFor!
reflectedVariablesFor: aService	| currentClass variables |	variables := OrderedCollection new.	currentClass := aService class templateClass.	[currentClass == RsrService]		whileFalse:			[currentClass instVarNames reverseDo: [:each | variables addFirst: each].			currentClass := currentClass superclass].	^variables! !

!RsrServiceSnapshot class methodsFor!
reflectedVariableIndicesFor: aServicedo: aBlock	| allVariables |	allVariables := aService class allInstVarNames.	(self reflectedVariablesFor: aService)		do:			[:varName | | index |			index := allVariables indexOf: varName.			aBlock value: index]! !

!RsrServiceSnapshot class methodsFor!
from: aService	^self new		snapshot: aService;		yourself! !

!RsrSendMessage class methodsFor!
transaction: aTransactionIdreceiverReference: aServiceReferenceselectorReference: aSelectorReferenceargumentReferences: anArrayOfReferences	^self new		transaction: aTransactionId;		receiverReference: aServiceReference;		selectorReference: aSelectorReference;		argumentReferences: anArrayOfReferences;		yourself! !

!RsrReleaseServices class methodsFor!
sids: anArrayOfServiceIDs	^self new		sids: anArrayOfServiceIDs;		yourself! !

!RsrLogWithPrefix class methodsFor!
prefix: aStringlog: aLog	^self new		prefix: aString;		log: aLog;		yourself! !

!RsrLogWithPrefix class methodsFor!
log: aLog	^self new		log: aLog;		yourself! !

!RsrBufferedSocketStream class methodsFor!
on: aSocketStream	^self new		stream: aSocketStream;		yourself! !

!RsrInMemoryChannel class methodsFor!
inQueue: inQueueoutQueue: outQueue	^self new		inQueue: inQueue;		outQueue: outQueue;		yourself! !

!RsrAcceptConnection class methodsFor!
wildcardPort	^0! !

!RsrAcceptConnection class methodsFor!
wildcardAddress	^'0.0.0.0'! !

!RsrAcceptConnection class methodsFor!
port: aPortInteger	^super		host: self wildcardAddress		port: aPortInteger! !

!RsrCustomSink class methodsFor!
action: aBlock	^self new		action: aBlock;		yourself! !

!RsrMessageSend class methodsFor!
receiver: anObjectselector: aSelectorarguments: anArray	^self new		receiver: anObject;		selector: aSelector;		arguments: anArray;		yourself! !

!RsrSocketConnectionSpecification class methodsFor!
host: hostnameOrAddressport: port	^self new		host: hostnameOrAddress;		port: port;		yourself! !

!RsrHandshake class methodsFor!
steps: anArrayOfStepsstream: aStream	^self new		steps: anArrayOfSteps;		stream: aStream;		yourself! !

!RsrGciAcceptConnection class methodsFor!
host: hostnameOrAddressport: porttoken: aToken	^self new		host: hostnameOrAddress;		port: port;		token: aToken;		yourself! !

!RsrPendingMessage class methodsFor!
services: aListpromise: aPromise	^self new		services: aList;		promise: aPromise;		yourself! !

!RsrRemoteException class methodsFor!
clientClassName	^#RsrRemoteExceptionClient! !

!RsrRemoteException class methodsFor!
serverClassName	^#RsrRemoteExceptionServer! !

!RsrRemoteException class methodsFor!
templateClassName	^#RsrRemoteException! !

!RsrRemoteException class methodsFor!
from: anException	"Create an instance of the RemoteException reason.	The client is used here because once we send it, we are done with it.	The client will GC and the server will later GC. We don't care to have	a server hanging around if we don't need it."	| tag |	tag := anException tag		ifNotNil:			[[anException tag asString]				on: Error				do: [:ex | ex return: 'Unable to pack #tag containing an instance of ', anException tag class name]].	^self clientClass new		exceptionClassName: anException class name;		tag: tag;		messageText: anException messageText;		stack: RsrProcessModel currentStackDump;		yourself! !

!RsrTokenExchange class methodsFor!
token: aToken	^self new		token: aToken;		yourself! !

!RsrPromiseResolutionAction class methodsFor!
when: aWhenBlockcatch: aCatchBlock	^self new		when: aWhenBlock;		catch: aCatchBlock;		yourself! !

!RsrChosenVersion class methodsFor!
version: aVersionNumber	^self new		version: aVersionNumber;		yourself! !

!RsrSupportedVersions class methodsFor!
versions: anArray	^self new		versions: anArray;		yourself! !

!RsrRemotePromiseResolver class methodsFor!
for: aSendMessageover: aConnection	^self new		sendMessage: aSendMessage;		connection: aConnection;		yourself! !

!RsrCommandDecoder class methodsFor!
registry: aRegistry	^self new		registry: aRegistry;		yourself! !

!RsrSnapshotAnalysis class methodsFor!
roots: anArrayconnection: aConnection	^self new		roots: anArray;		connection: aConnection;		yourself! !

!RsrStreamChannelLoop class methodsFor!
on: aChannel	^self new		channel: aChannel;		yourself! !

!RsrBinaryStreamChannel class methodsFor!
inStream: inStreamoutStream: outStream	^self new		inStream: inStream;		outStream: outStream;		yourself! !

!RsrSocketStream class methodsFor!
on: anRsrSocket	^self new		socket: anRsrSocket;		yourself! !

!RsrDecodingRaisedException class methodsFor!
exception: anException	^self new		exception: anException;		yourself! !

!RsrTokenExchangeCodec methodsFor!
decodeToken: aStream	| size |	size := self decodeControlWord: aStream.	^RsrToken bytes: (aStream next: size)! !

!RsrTokenExchangeCodec methodsFor!
tokenAcceptedIdentifier	^1! !

!RsrTokenExchangeCodec methodsFor!
tokenIdentifier	^0! !

!RsrTokenExchangeCodec methodsFor!
decode: aStream	| identifier |	identifier := self decodeControlWord: aStream.	identifier = self tokenIdentifier		ifTrue: [^self decodeToken: aStream].	identifier = self tokenAcceptedIdentifier		ifTrue: [^RsrTokenAccepted new].	identifier = self tokenRejectedIdentifier		ifTrue: [^RsrTokenRejected new].	^RsrTokenExchangeFailed signal: 'Unknown identifier: ', identifier printString! !

!RsrTokenExchangeCodec methodsFor!
encodeToken: aTokenonto: aStream	self		encodeControlWord: self tokenIdentifier		onto: aStream.	self		encodeControlWord: aToken bytes size		onto: aStream.	aStream nextPutAll: aToken bytes! !

!RsrTokenExchangeCodec methodsFor!
encodeTokenAccepted: aTokenAcceptedonto: aStream	self		encodeControlWord: self tokenAcceptedIdentifier		onto: aStream! !

!RsrTokenExchangeCodec methodsFor!
encodeTokenRejected: aTokenRejectedonto: aStream	self		encodeControlWord: self tokenRejectedIdentifier		onto: aStream! !

!RsrTokenExchangeCodec methodsFor!
tokenRejectedIdentifier	^2! !

!RsrProtocolVersionNegotiationClient methodsFor!
performOver: aStream	"Perform the Client's porition of the handshake"	| supportedVersions answer |	supportedVersions := RsrSupportedVersions versions: #(1).	self codec		encodeSupportedVersions: supportedVersions		onto: aStream.	aStream flush.	answer := self codec decode: aStream.	answer hasSharedVersion		ifFalse: [^RsrProtocolVersionNegotiationFailed signal: 'The Client and Server could not agree on an RSR protocol version.']! !

!RsrNumericSpigot methodsFor!
step: anIncrement	step := anIncrement! !

!RsrNumericSpigot methodsFor!
step	^step! !

!RsrNumericSpigot methodsFor!
next	| result |	result := current.	current := current + step.	^result! !

!RsrNumericSpigot methodsFor!
next: aCount	| result |	result := Array new: aCount.	1 to: aCount do: [:i | result at: i put: self next].	^result! !

!RsrNumericSpigot methodsFor!
negated	^self class		start: current negated		step: step negated! !

!RsrNumericSpigot methodsFor!
start: aNumber	current := aNumber! !

!RsrPromiseResolutionAction methodsFor!
catch	^catch! !

!RsrPromiseResolutionAction methodsFor!
when: aBlock	when := aBlock! !

!RsrPromiseResolutionAction methodsFor!
catch: aBlock	catch := aBlock! !

!RsrPromiseResolutionAction methodsFor!
when	^when! !

!RsrSupportedVersions methodsFor!
hash	^self versions hash! !

!RsrSupportedVersions methodsFor!
versions	^versions! !

!RsrSupportedVersions methodsFor!
versions: anArray	versions := anArray! !

!RsrSupportedVersions methodsFor!
= aSupportedVersions	self class = aSupportedVersions class		ifFalse: [^false].	^self versions = aSupportedVersions versions! !

!RsrReleaseServices methodsFor!
sids	^sids! !

!RsrReleaseServices methodsFor!
sids: anArrayOfServiceIDs	sids := anArrayOfServiceIDs! !

!RsrReleaseServices methodsFor!
executeFor: aConnection	sids do: [:sid | aConnection _remoteClientReleased: sid]! !

!RsrReleaseServices methodsFor!
reportOn: aLog	aLog debug: 'RsrReleaseObjects(', self sids printString, ')'! !

!RsrReleaseServices methodsFor!
encode: aStreamusing: anEncoder	anEncoder		encodeReleaseServices: self		onto: aStream! !

!RsrTokenSender methodsFor!
performOver: aStream	"Send the token. Wait for confirmation."	| confirmation |	self codec		encodeToken: self token		onto: aStream.	aStream flush.	confirmation := self codec decode: aStream.	confirmation wasAccepted		ifFalse: [RsrTokenExchangeFailed signal: 'Token was rejected']! !

!RsrTokenReceiver methodsFor!
performOver: aStream	"Send the token. Wait for confirmation."	| receivedToken |	receivedToken := self codec decode: aStream.	receivedToken = self token		ifTrue:			[self codec				encodeTokenAccepted: nil "RsrTokenAccepted new"				onto: aStream.			aStream flush]		ifFalse:			[self codec				encodeTokenRejected: nil "RsrTokenRejected new"				onto: aStream.			aStream flush.			RsrTokenExchangeFailed signal]! !

!RsrInMemoryConnectionSpecification methodsFor!
connect	"Establish an internal Connection pair via SharedQueues."	| aQueue bQueue channelA channelB |	aQueue := SharedQueue new.	bQueue := SharedQueue new.	channelA := RsrInMemoryChannel		inQueue: aQueue		outQueue: bQueue.	channelB := RsrInMemoryChannel		inQueue: bQueue		outQueue: aQueue.	connectionA := RsrConnection		specification: self		channel: channelA		transactionSpigot: RsrThreadSafeNumericSpigot naturals		oidSpigot: RsrThreadSafeNumericSpigot naturals.	connectionB := RsrConnection		specification: self		channel: channelB		transactionSpigot: RsrThreadSafeNumericSpigot naturals negated		oidSpigot: RsrThreadSafeNumericSpigot naturals negated.	connectionA open.	connectionB open.	self assertOpen.	^connectionA! !

!RsrGciAcceptConnection methodsFor!
initialize	super initialize.	token := RsrToken newRandom! !

!RsrGciAcceptConnection methodsFor!
token: aToken	"Stores the token used during handshake."	token := aToken! !

!RsrGciAcceptConnection methodsFor!
handshakeSteps	"Returns a sequence of steps needed to perform a successful handshake."	^Array		with: RsrProtocolVersionNegotiationServer new		with: (RsrTokenReceiver token: self token)! !

!RsrGciAcceptConnection methodsFor!
token	"Returns the token used during handshake."	^token! !

!RsrMessageSend methodsFor!
selector: aSelector	selector := aSelector! !

!RsrMessageSend methodsFor!
arguments: anArray	arguments := anArray! !

!RsrMessageSend methodsFor!
receiver	^receiver! !

!RsrMessageSend methodsFor!
receiver: anObject	receiver := anObject! !

!RsrMessageSend methodsFor!
arguments	^arguments! !

!RsrMessageSend methodsFor!
selector	^selector! !

!RsrMessageSend methodsFor!
perform	^self receiver		perform: self selector		withArguments: self arguments! !

!RsrSocketStream methodsFor!
socket: anRsrSocket	socket := anRsrSocket! !

!RsrSocketStream methodsFor!
nextPutAll: bytes	"Write <bytes> to the socket."	| chunkSize position numBytes numWritten |	chunkSize := self chunkSize.	position := 1.	numBytes := bytes size.	[position <= numBytes]		whileTrue:			[numWritten := socket				write: (chunkSize min: numBytes - position + 1)				from: bytes				startingAt: position.			position := position + numWritten]! !

!RsrSocketStream methodsFor!
close	socket close! !

!RsrSocketStream methodsFor!
next: count	"Return exactly <count> number of bytes.	Signal RsrSocketClosed if the socket closes."	| chunkSize bytes position numRead |	chunkSize := self chunkSize.	bytes := ByteArray new: count.	position := 1.	[position <= count]		whileTrue:			[numRead := socket				read: (chunkSize min: count - position + 1)				into: bytes				startingAt: position.			position := position + numRead].	^bytes! !

!RsrSocketStream methodsFor!
next	"Return the next byte"	^self next: 1! !

!RsrSocketStream methodsFor!
chunkSize	"The largest size that should be read from or written to a Socket in each attempt."	^4096! !

!RsrSocketStream methodsFor!
atEnd	"Return whether additional bytes could become available on the socket."	^socket isConnected not! !

!RsrCommandEncoder methodsFor!
encodeDeliverResponse: aDeliverResponse	^ByteArray streamContents: [:stream | self encodeDeliverResponse: aDeliverResponse onto: stream]! !

!RsrCommandEncoder methodsFor!
encodeDeliverResponse: aDeliverResponseonto: aStream	self		encodeControlWord: self deliverResponseCommand		onto: aStream.	self		encodeControlWord: aDeliverResponse transaction		onto: aStream.	self		encodeControlWord: aDeliverResponse snapshots size		onto: aStream.	aDeliverResponse snapshots do: [:each | self encodeServiceSnapshot: each onto: aStream].	self		encodeReference: aDeliverResponse response		onto: aStream! !

!RsrCommandEncoder methodsFor!
encodeServiceSnapshot: aServiceSnapshot	^ByteArray		streamContents:			[:stream |			self				encodeServiceSnapshot: aServiceSnapshot				onto: stream]! !

!RsrCommandEncoder methodsFor!
encodeServiceSnapshot: aServiceSnapshotonto: aStream	aServiceSnapshot		encode: aStream		using: self! !

!RsrCommandEncoder methodsFor!
encodeSendMessage: aSendMessage	^ByteArray streamContents: [:stream | self encodeSendMessage: aSendMessage onto: stream]! !

!RsrCommandEncoder methodsFor!
encodeReleaseServices: aReleaseServicesonto: aStream	self		encodeControlWord: self releaseObjectsCommand		onto: aStream.	self		encodeControlWord: aReleaseServices sids size		onto: aStream.	aReleaseServices sids		do:			[:sid |			self				encodeControlWord: sid				onto: aStream]! !

!RsrCommandEncoder methodsFor!
encodeReference: aReferenceonto: aStream	aReference		encode: aStream		using: self! !

!RsrCommandEncoder methodsFor!
encodeReleaseServices: aReleaseServices	^ByteArray streamContents: [:stream | self encodeReleaseServices: aReleaseServices onto: stream]! !

!RsrCommandEncoder methodsFor!
encodeSendMessage: aSendMessageonto: aStream	self		encodeControlWord: self sendMessageCommand		onto: aStream.	self		encodeControlWord: aSendMessage transaction		onto: aStream.	self		encodeControlWord: aSendMessage snapshots size		onto: aStream.	aSendMessage snapshots		do:			[:each |			self				encodeServiceSnapshot: each				onto: aStream].	self		encodeReference:  aSendMessage receiverReference		onto: aStream.	self		encodeReference: aSendMessage selectorReference		onto: aStream.	self		encodeControlWord: aSendMessage argumentReferences size		onto: aStream.	aSendMessage argumentReferences		do:			[:each |			self				encodeReference: each				onto: aStream]! !

!RsrDecodingRaisedException methodsFor!
exception	^exception! !

!RsrDecodingRaisedException methodsFor!
exception: anException	exception := anException! !

!RsrCodec methodsFor!
integerAsByteArray: anIntegerofSize: aNumberOfBytes	| bytes int |	bytes := ByteArray new: aNumberOfBytes.	int := anInteger.	aNumberOfBytes		to: 1		by: -1		do:			[:i | | byte |			byte := int bitAnd: 16rFF.			int := int bitShift: -8.			bytes at: i put: byte].	int ~= 0		ifTrue: [self error: 'Loss of precision detected'].	^bytes! !

!RsrCodec methodsFor!
sizeOfInteger	"Return the number of bytes used to encode an integer"	^8! !

!RsrCodec methodsFor!
controlWordMin	^(2 raisedTo: 63) negated! !

!RsrCodec methodsFor!
controlWordMax	^(2 raisedTo: 63) - 1! !

!RsrCodec methodsFor!
encodeControlWord: anIntegeronto: aStream	| encodedInteger encodedBytes |	(anInteger between: self controlWordMin and: self controlWordMax)		ifFalse: [self error: anInteger printString, ' is outside the supported size of a control word.'].	encodedInteger := (anInteger positive		ifTrue: [anInteger]		ifFalse: [(2 raisedTo: 64) + anInteger]).	encodedBytes := self		integerAsByteArray: encodedInteger		ofSize: self sizeOfInteger.	aStream nextPutAll: encodedBytes! !

!RsrCodec methodsFor!
decodeControlWord: aStream	| bytes unsignedResult |	bytes := aStream next: self sizeOfInteger.	unsignedResult := self bytesAsInteger: bytes.	^unsignedResult > self controlWordMax		ifTrue: [(2 raisedTo: 64) negated + unsignedResult]		ifFalse: [unsignedResult]! !

!RsrCodec methodsFor!
bytesAsInteger: bytes	| res |	res := 0.	bytes do: [:e | res := (res bitShift: 8) bitOr: e].	^res! !

!RsrTranscriptSink methodsFor!
write: aMessageString	Transcript		show: aMessageString;		cr! !

!RsrTokenExchange methodsFor!
codec	^RsrTokenExchangeCodec new! !

!RsrTokenExchange methodsFor!
token: aToken	token := aToken! !

!RsrTokenExchange methodsFor!
token	^token! !

!RsrPendingMessage methodsFor!
services	^services! !

!RsrPendingMessage methodsFor!
services: aList	services := aList! !

!RsrPendingMessage methodsFor!
promise	^promise! !

!RsrPendingMessage methodsFor!
promise: aPromise	promise := aPromise! !

!RsrTokenRejected methodsFor!
wasAccepted	^false! !

!RsrStream methodsFor!
nextPutAll: aByteArray	"Write <aByteArray>'s elements to the backing store."	^self subclassResponsibility! !

!RsrStream methodsFor!
close	"Close the Stream. The semantics of this are defined by the subclass."	self subclassResponsibility! !

!RsrStream methodsFor!
next	"Read and return exactly 1 byte."	^self next: 1! !

!RsrStream methodsFor!
next: count	"Read and return exactly <count> bytes"	^self subclassResponsibility! !

!RsrStream methodsFor!
flush	"Ensure any data cached by the receiver is pushed to its destination."	"By default, do nothing."! !

!RsrStream methodsFor!
atEnd	"Answers when the Stream cannot take or provide any additional bytes."	^self subclassResponsibility! !

!RsrLogWithPrefix methodsFor!
prefix	^prefix! !

!RsrLogWithPrefix methodsFor!
log	^log! !

!RsrLogWithPrefix methodsFor!
log: aLog	log := aLog! !

!RsrLogWithPrefix methodsFor!
debug: aString	^self log debug: self prefix, '/', aString! !

!RsrLogWithPrefix methodsFor!
prefix: aString	prefix := aString! !

!RsrRemotePromiseResolver methodsFor!
sendMessage	^sendMessage! !

!RsrRemotePromiseResolver methodsFor!
fulfill: result	"Fulfill the remote promise with a fulfilled value of <result>"	self resolution: (Array with: #fulfill with: result)! !

!RsrRemotePromiseResolver methodsFor!
sendResultReference: resultReferencesnapshots: snapshots	| response |	response := RsrDeliverResponse				transaction: self sendMessage transaction				responseReference: resultReference				snapshots: snapshots.	self connection _sendCommand: response! !

!RsrRemotePromiseResolver methodsFor!
hasResolved	^hasResolved! !

!RsrRemotePromiseResolver methodsFor!
initialize	super initialize.	extraRoots := OrderedCollection new.	hasResolved := false.	mutex := Semaphore forMutualExclusion! !

!RsrRemotePromiseResolver methodsFor!
connection: aConnection	connection := aConnection! !

!RsrRemotePromiseResolver methodsFor!
resolution: result	"Process and dispatch the result"	mutex		critical:			[self hasResolved ifTrue: [^self].			[self				sendResult: result				closureRoots: (Array with: result), extraRoots]				on: Error				do:					[:ex | | answer |					answer := Array						with: #break						with: (RsrRemoteException from: ex).					self						sendResult: answer						closureRoots: answer.					ex return].			hasResolved := true]! !

!RsrRemotePromiseResolver methodsFor!
addRoot: aService	mutex critical: [extraRoots add: aService]! !

!RsrRemotePromiseResolver methodsFor!
break: aReason	"<aReason> can be any object supported by RSR."	self resolution: (Array with: #break with: aReason)! !

!RsrRemotePromiseResolver methodsFor!
sendMessage: aSendMessage	sendMessage := aSendMessage! !

!RsrRemotePromiseResolver methodsFor!
sendResult: resultclosureRoots: roots	| analysis resultReference |	analysis := RsrSnapshotAnalysis		roots: roots		connection: self connection.	analysis perform.	resultReference := RsrReference from: result.	self		sendResultReference: resultReference		snapshots: analysis snapshots! !

!RsrRemotePromiseResolver methodsFor!
connection	^connection! !

!RsrRemotePromiseResolver methodsFor!
assertNotResolved	self hasResolved		ifTrue: [RsrAlreadyResolved signal]! !

!RsrInMemoryChannel methodsFor!
drainLoop	| command |	[command := inQueue next.	command isNil]		whileFalse:			[self received: command].	self connection channelDisconnected! !

!RsrInMemoryChannel methodsFor!
isConnected	^drainProcess isNil not! !

!RsrInMemoryChannel methodsFor!
outQueue: aSharedQueue	outQueue := aSharedQueue! !

!RsrInMemoryChannel methodsFor!
close	outQueue nextPut: nil.	inQueue nextPut: nil! !

!RsrInMemoryChannel methodsFor!
inQueue: aSharedQueue	inQueue := aSharedQueue! !

!RsrInMemoryChannel methodsFor!
open	drainProcess := RsrProcessModel		fork:			[RsrProcessModel configureCommunicationsProcess.			self drainLoop.			drainProcess := nil]		named: 'InMemoryChannel Receiving'! !

!RsrInMemoryChannel methodsFor!
send: aCommand	outQueue nextPut: aCommand! !

!RsrInMemoryChannel methodsFor!
inQueue	^inQueue! !

!RsrInMemoryChannel methodsFor!
outQueue	^outQueue! !

!RsrInternalSocketConnectionSpecification methodsFor!
defaultPort	"Returns the default port number used to listen for connections."	^61982! !

!RsrInternalSocketConnectionSpecification methodsFor!
connect	"Establish an internal Connection pair via socket."	| acceptor initiator |	acceptor := RsrAcceptConnection port: self defaultPort.	initiator := RsrInitiateConnection host: '127.0.0.1' port: self defaultPort.	RsrProcessModel		fork: [connectionA := acceptor waitForConnection]		named: 'Pending AcceptConnection'.	self minimalWait. "Allow other process to schedule."	connectionB := initiator connect.	self minimalWait. "Allow other process to schedule."	self assertOpen.	connectionA specification: self.	connectionB specification: self.	^connectionA! !

!RsrLogSink methodsFor!
write: aMessage	self subclassResponsibility! !

!RsrChosenVersion methodsFor!
version	^version! !

!RsrChosenVersion methodsFor!
version: aVersionNumber	version := aVersionNumber! !

!RsrChosenVersion methodsFor!
= aChosenVersion	^self class = aChosenVersion class and: [self version = aChosenVersion version]! !

!RsrChosenVersion methodsFor!
hasSharedVersion	"Answer whether there is a valid shared protocol version between the Client and Server."	^true! !

!RsrLog methodsFor!
levelError	^1! !

!RsrLog methodsFor!
levelInfo	^3! !

!RsrLog methodsFor!
critical: aString	self verbosity >= self levelCritical		ifTrue: [self log: aString level: #critical]! !

!RsrLog methodsFor!
debug: aString	self verbosity >= self levelDebug		ifTrue: [	self log: aString level: #debug]! !

!RsrLog methodsFor!
levelTrace	^5! !

!RsrLog methodsFor!
log: aMessagelevel: aLevelString	| message |	message := RsrDateAndTime now printString, '-', aLevelString, '-', aMessage.	sinks do: [:each | each write: message]! !

!RsrLog methodsFor!
levelDebug	^4! !

!RsrLog methodsFor!
levelCritical	^0! !

!RsrLog methodsFor!
verbosity	^verbosity! !

!RsrLog methodsFor!
initialize	super initialize.	verbosity := self levelTrace.	sinks := OrderedCollection new! !

!RsrLog methodsFor!
warning: aString	self verbosity >= self levelWarn		ifTrue: [self log: aString level: #warning]! !

!RsrLog methodsFor!
addSink: aLogSink	sinks add: aLogSink! !

!RsrLog methodsFor!
verbosity: aLogLevel	verbosity := aLogLevel! !

!RsrLog methodsFor!
info: aString	self verbosity >= self levelInfo		ifTrue: [self log: aString level: #info]! !

!RsrLog methodsFor!
levelWarn	^2! !

!RsrLog methodsFor!
trace: aString	self verbosity >= self levelTrace		ifTrue: [self log: aString level: #trace]! !

!RsrLog methodsFor!
error: aString	self verbosity >= self levelError		ifTrue: [self log: aString level: #error]! !

!RsrCommandSource methodsFor!
runLoopName	^'Connection Reading'! !

!RsrCommandSource methodsFor!
inStream	"Return the read stream associated w/ this channel."	^self channel inStream! !

!RsrCommandSource methodsFor!
nextCommand	^self decoder decodeCommand: self inStream! !

!RsrCommandSource methodsFor!
executeCycle	[| command |	command := self nextCommand.	self report: command.	self channel received: command]		on: RsrSocketClosed		do:			[:ex |			self reportException: ex.			self channel channelDisconnected]! !

!RsrCommandSource methodsFor!
decoder	^RsrCommandDecoder new! !

!RsrCommandSink methodsFor!
write: aByteArray	self outStream nextPutAll: aByteArray! !

!RsrCommandSink methodsFor!
stop	super stop.	queue nextPut: self stopToken! !

!RsrCommandSink methodsFor!
flush	self outStream flush! !

!RsrCommandSink methodsFor!
stopToken	^self stoppedState! !

!RsrCommandSink methodsFor!
executeCycle	[| command |	command := queue next.	command == self stopToken		ifTrue: [^self].	self writeCommand: command.	(queue size = 0) "Dolphin does not support #isEmpty"		ifTrue: [self flush]]		on: RsrSocketClosed		do:			[:ex |			self reportException: ex.			self channel channelDisconnected]! !

!RsrCommandSink methodsFor!
outStream	^self channel outStream! !

!RsrCommandSink methodsFor!
writeCommand: aCommand	self report: aCommand.	aCommand		encode: self outStream		using: self encoder! !

!RsrCommandSink methodsFor!
initialize	super initialize.	queue := SharedQueue new! !

!RsrCommandSink methodsFor!
encoder	^RsrCommandEncoder new! !

!RsrCommandSink methodsFor!
enqueue: aCommand	self isActive ifTrue: [queue nextPut: aCommand]! !

!RsrCommandSink methodsFor!
runLoopName	^'Connection Writing'! !

!RsrProtocolVersionNegotiationCodec methodsFor!
decodeSupportedVersions: aStream	| numberOfVersions versions |	numberOfVersions := self decodeControlWord: aStream.	versions := (1 to: numberOfVersions) collect: [:each | self decodeControlWord: aStream].	^RsrSupportedVersions versions: versions! !

!RsrProtocolVersionNegotiationCodec methodsFor!
encodeSupportedVersions: aSupportedVersionsonto: aStream	| versions |	versions := aSupportedVersions versions.	self		encodeControlWord: self supportedVersionsIdentifier		onto: aStream.	self		encodeControlWord: versions size		onto: aStream.	versions do: [:each | self encodeControlWord: each onto: aStream]! !

!RsrProtocolVersionNegotiationCodec methodsFor!
chosenVersionIdentifier	^1! !

!RsrProtocolVersionNegotiationCodec methodsFor!
supportedVersionsIdentifier	^0! !

!RsrProtocolVersionNegotiationCodec methodsFor!
noVersionOverlapIdentifier	^2! !

!RsrProtocolVersionNegotiationCodec methodsFor!
encodeChosenVersion: aChosenVersiononto: aStream	self		encodeControlWord: self chosenVersionIdentifier		onto: aStream.	self		encodeControlWord: aChosenVersion version		onto: aStream! !

!RsrProtocolVersionNegotiationCodec methodsFor!
decode: aStream	"Decode a message from <aStream>"	| identifier |	identifier := self decodeControlWord: aStream.	identifier = self supportedVersionsIdentifier		ifTrue: [^self decodeSupportedVersions: aStream].	identifier = self chosenVersionIdentifier		ifTrue: [^self decodeChosenVersion: aStream].	identifier = self noVersionOverlapIdentifier		ifTrue: [^self decodeNoVersionOverlap: aStream].	^RsrProtocolVersionNegotiationFailed signal: 'Unknown identifier: ', identifier printString! !

!RsrProtocolVersionNegotiationCodec methodsFor!
decodeChosenVersion: aStream	| version |	version := self decodeControlWord: aStream.	^RsrChosenVersion version: version! !

!RsrProtocolVersionNegotiationCodec methodsFor!
decodeNoVersionOverlap: aStream	^RsrNoVersionOverlap new! !

!RsrProtocolVersionNegotiationCodec methodsFor!
encodeNoVersionOverlap: aNoVersionOverlaponto: aStream	self		encodeControlWord: self noVersionOverlapIdentifier		onto: aStream! !

!RsrProtocolVersionNegotiation methodsFor!
codec	^RsrProtocolVersionNegotiationCodec new! !

!RsrHandshakeStep methodsFor!
performOver: aStream	"Perform the work for this step."	^self subclassResponsibility! !

!RsrTokenAccepted methodsFor!
wasAccepted	^true! !

!RsrCustomSink methodsFor!
action: aBlock	action := aBlock! !

!RsrCustomSink methodsFor!
action	^action! !

!RsrCustomSink methodsFor!
write: aMessage	self action value: aMessage! !

!RsrSendMessage methodsFor!
selectorReference: aSymbolReference	selectorReference := aSymbolReference! !

!RsrSendMessage methodsFor!
logException: anExceptionto: aLog	| message |	message := String		streamContents:			[:stream |			stream				print: self receiverReference;				nextPutAll: '>>';				print: self selectorReference;				nextPutAll: ' due to: ';				nextPutAll: anException description].	aLog error: message! !

!RsrSendMessage methodsFor!
selectorReference	^selectorReference! !

!RsrSendMessage methodsFor!
executeFor: aConnection	| resolver servicesStrongly receiver selector arguments messageSend |	resolver := RsrRemotePromiseResolver for: self over: aConnection.	"Must keep a strong reference to each service until the roots are referenced."	[[RsrProcessModel configureUnhandleExceptionProtection.	servicesStrongly := self reifyAllIn: aConnection.	receiver := self receiverReference resolve: aConnection.	selector := self selectorReference resolve: aConnection.	arguments := self argumentReferences collect: [:each | each resolve: aConnection].	RsrProcessModel renameProcess: '', receiver class name, '>>', selector.	"receiver and arguments should now be the roots of the service graph, discard strong references."	servicesStrongly := nil.	resolver addRoot: receiver. "Ensure we always send back the receiver -- this ensures sending a message results in by-directional syncing."	messageSend := RsrMessageSend		               receiver: receiver		               selector: selector		               arguments: arguments.	self perform: messageSend answerUsing: resolver]		on: self unhandledExceptionClass		do: [:ex | 			resolver break: (RsrRemoteException from: ex exception).			ex return]]		ensure:			[resolver hasResolved				ifFalse: [resolver break: 'Message send terminated without a result']]! !

!RsrSendMessage methodsFor!
encode: aStreamusing: anEncoder	anEncoder		encodeSendMessage: self		onto: aStream! !

!RsrSendMessage methodsFor!
unhandledExceptionClass	"The class which signals that an unhandled execption has been signaled."	^RsrProcessModel unhandledExceptionClass! !

!RsrSendMessage methodsFor!
perform: aMessageSendanswerUsing: aResolver	[| result |	aMessageSend receiver configureProcess.	result := aMessageSend perform.	RsrProcessModel configureFrameworkProcess.	aResolver fulfill: result]		on: self unhandledExceptionClass		do:			[:ex | | debugResult |			debugResult := [aMessageSend receiver									debug: ex exception									raisedDuring: aMessageSend									answerUsing: aResolver]									on: self unhandledExceptionClass									do:										[:debugEx |										RsrProcessModel configureFrameworkProcess.										aResolver break: (RsrRemoteException from: debugEx exception).										ex return].			RsrProcessModel configureFrameworkProcess.			aResolver hasResolved				ifTrue: [ex return]				ifFalse:					[ex exception isResumable						ifTrue: [[ex resume: debugResult] ensure: [aMessageSend receiver configureProcess]] "This needs to be a protected call."						ifFalse:							[aResolver break: (RsrRemoteException from: ex exception).							ex return]]]! !

!RsrSendMessage methodsFor!
reportOn: aLog	aLog debug: 'RsrSendMessage(', self receiverReference asString, '>>', self selectorReference asString, ')'! !

!RsrSendMessage methodsFor!
argumentReferences	^argumentReferences! !

!RsrSendMessage methodsFor!
argumentReferences: anArrayOfReferences	argumentReferences := anArrayOfReferences! !

!RsrSendMessage methodsFor!
receiverReference	^receiverReference! !

!RsrSendMessage methodsFor!
receiverReference: aServiceReference	receiverReference := aServiceReference! !

!RsrBinaryStreamChannel methodsFor!
close	"Shutdown the Command sink and source."	source stop.	sink stop.	outStream		flush;		close.	inStream close! !

!RsrBinaryStreamChannel methodsFor!
inStream	"Returns the stream associated w/ reading"	^inStream! !

!RsrBinaryStreamChannel methodsFor!
send: aCommand	"Send the provided command over the channel"	sink enqueue: aCommand! !

!RsrBinaryStreamChannel methodsFor!
outStream	"Returns the stream associated w/ writing"	^outStream! !

!RsrBinaryStreamChannel methodsFor!
initialize	super initialize.	source := RsrCommandSource on: self.	sink := RsrCommandSink on: self! !

!RsrBinaryStreamChannel methodsFor!
disconnected	"The socket has disconnected so the channel is no longer open."	self connection channelDisconnected! !

!RsrBinaryStreamChannel methodsFor!
open	"Ensure the Command sink and source are running"	source start.	sink start! !

!RsrBinaryStreamChannel methodsFor!
isConnected	^self inStream atEnd not and: [self outStream atEnd not]! !

!RsrBinaryStreamChannel methodsFor!
sink	^sink! !

!RsrBinaryStreamChannel methodsFor!
outStream: aBinaryWriteStream	"Sets the stream associated w/ writing"	outStream := aBinaryWriteStream! !

!RsrBinaryStreamChannel methodsFor!
source	^source! !

!RsrBinaryStreamChannel methodsFor!
inStream: aBinaryReadStream	"Sets the stream associated w/ reading"	inStream := aBinaryReadStream! !

!RsrMessagingCommand methodsFor!
snapshots	^snapshots! !

!RsrMessagingCommand methodsFor!
transaction	^ transaction! !

!RsrMessagingCommand methodsFor!
reifyAllIn: aConnection	| servicesStrongly |	"Must keep a strong reference to each service until we're sure a parent service is reified"	servicesStrongly := snapshots collect: [ :each | 		                    (each instanceIn: aConnection) preUpdate ].	snapshots do: [ :each | each reifyIn: aConnection ].	servicesStrongly do: [ :each | each postUpdate ].	^ servicesStrongly "Sender must keep a strong reference until the root is anchored."! !

!RsrMessagingCommand methodsFor!
snapshots: anArrayOfSnapshots	snapshots := anArrayOfSnapshots! !

!RsrMessagingCommand methodsFor!
transaction: anObject	transaction := anObject! !

!RsrNoVersionOverlap methodsFor!
hash	^self class hash! !

!RsrNoVersionOverlap methodsFor!
= aNoVersionOverlap	^self class = aNoVersionOverlap class! !

!RsrNoVersionOverlap methodsFor!
hasSharedVersion	"Answer whether there is a valid shared protocol version between the Client and Server."	^false! !

!RsrServiceSnapshot methodsFor!
snapshot: aService	sid := aService _id.	targetClassName := aService class isClientClass		ifTrue: [aService class serverClassName]		ifFalse: [aService class clientClassName].	slots := OrderedCollection new.	RsrServiceSnapshot		reflectedVariablesFor: aService		do: [:each | slots add: (RsrReference from: each)]! !

!RsrServiceSnapshot methodsFor!
slots: anArrayOfReferences	slots := anArrayOfReferences! !

!RsrServiceSnapshot methodsFor!
targetClass	^RsrClassResolver classNamed: self targetClassName! !

!RsrServiceSnapshot methodsFor!
instanceIn: aConnection	| instance |	instance := aConnection		serviceAt: self sid		ifAbsent: [self createInstanceRegisteredIn: aConnection].	self shouldCreateServer		ifTrue: [aConnection _stronglyRetain: instance].	^instance! !

!RsrServiceSnapshot methodsFor!
slots	^slots! !

!RsrServiceSnapshot methodsFor!
createInstanceRegisteredIn: aConnection	| instance |	instance := self shouldCreateServer		ifTrue: [self templateClass serverClass basicNew]		ifFalse: [self templateClass clientClass basicNew].	aConnection		_register: instance		as: self sid.	^instance! !

!RsrServiceSnapshot methodsFor!
encode: aStreamusing: anEncoder	anEncoder		encodeControlWord: self snapshotIdentifier		onto: aStream.	anEncoder		encodeControlWord: self sid		onto: aStream.	anEncoder		encodeControlWord: self slots size		onto: aStream.	self targetClassNameReference		encode: aStream		using: anEncoder.	self slots do: [:each | each encode: aStream using: anEncoder]! !

!RsrServiceSnapshot methodsFor!
decode: aStreamusing: aDecoder	| species instVarCount |	species := aDecoder decodeControlWord: aStream.	sid := aDecoder decodeControlWord: aStream.	instVarCount := aDecoder decodeControlWord: aStream.	targetClassName := (aDecoder decodeReference: aStream) resolve: nil.	slots := OrderedCollection new: instVarCount.	instVarCount timesRepeat: [slots add: (aDecoder decodeReference: aStream)]! !

!RsrServiceSnapshot methodsFor!
shouldCreateServer	^self targetServiceType == #server! !

!RsrServiceSnapshot methodsFor!
sid	^sid! !

!RsrServiceSnapshot methodsFor!
reifyIn: aConnection	| instance referenceStream |	"Instance should already be registered"	instance := self instanceIn: aConnection.	(self class reflectedVariablesFor: instance) size = slots size 		ifFalse: [ self error: 'Incorrectly encoded instance detected' ].	referenceStream := ReadStream on: slots.	self class reflectedVariableIndicesFor: instance do: [ :index | 		instance			instVarAt: index			put: (referenceStream next resolve: aConnection) ].	^ instance! !

!RsrServiceSnapshot methodsFor!
snapshotIdentifier	^0! !

!RsrServiceSnapshot methodsFor!
sid: aServiceID	sid := aServiceID! !

!RsrServiceSnapshot methodsFor!
targetClassNameReference	^RsrSymbolReference from: self targetClassName! !

!RsrServiceSnapshot methodsFor!
targetServiceType	^self targetClass isClientClass		ifTrue: [#client]		ifFalse: [#server]! !

!RsrServiceSnapshot methodsFor!
targetClassName	^targetClassName! !

!RsrServiceSnapshot methodsFor!
templateClass	^self targetClass templateClass! !

!RsrCommandCodec methodsFor!
deliverResponseCommand	^2! !

!RsrCommandCodec methodsFor!
deliverErrorResponseCommand	^4! !

!RsrCommandCodec methodsFor!
immediateOID	^0! !

!RsrCommandCodec methodsFor!
releaseObjectsCommand	^3! !

!RsrCommandCodec methodsFor!
sendMessageCommand	^1! !

!RsrAcceptConnection methodsFor!
cancelWaitForConnection	listener ifNotNil: [:socket | socket close]! !

!RsrAcceptConnection methodsFor!
initialize	super initialize.	listener := self socketClass new.	isWaitingForConnection := false.	isListening := false! !

!RsrAcceptConnection methodsFor!
ensureListening	isListening ifTrue: [^self].	listener		bindAddress: self host		port: self port.	listener listen: 1.	isListening := true! !

!RsrAcceptConnection methodsFor!
isWaitingForConnection	^isWaitingForConnection! !

!RsrAcceptConnection methodsFor!
handshakeSteps	"Returns a sequence of steps needed to perform a successful handshake."	^Array		with: RsrProtocolVersionNegotiationServer new! !

!RsrAcceptConnection methodsFor!
waitForConnection	| socket stream handshake channel connection |	self ensureListening.	[isWaitingForConnection := true.	socket := [listener accept]		on: RsrSocketError		do: [:ex | ex resignalAs: RsrWaitForConnectionCancelled new]]			ensure:				[listener close.				listener := nil.				isWaitingForConnection := false].	stream := RsrSocketStream on: socket.	handshake := RsrHandshake		steps: self handshakeSteps		stream: stream.	handshake perform.	channel := RsrBinaryStreamChannel		inStream: stream		outStream: stream.	connection := RsrConnection		specification: self		channel: channel		transactionSpigot: RsrThreadSafeNumericSpigot naturals		oidSpigot: RsrThreadSafeNumericSpigot naturals.	^connection open! !

!RsrAcceptConnection methodsFor!
listeningPort	"Return the port the underlying socket is listening on.	This is useful when using the wildcard port to dynamically	assign a port number."	isListening ifFalse: [^nil].	^listener port! !

!RsrStreamChannelLoop methodsFor!
stop	self isActive ifFalse: [^self].	state := self stoppedState! !

!RsrStreamChannelLoop methodsFor!
log: aString	self log debug: aString! !

!RsrStreamChannelLoop methodsFor!
executeCycle	self subclassResponsibility! !

!RsrStreamChannelLoop methodsFor!
isProcessActive	^process ~~ nil! !

!RsrStreamChannelLoop methodsFor!
start	state := self runningState.	process := RsrProcessModel		fork:			[RsrProcessModel configureCommunicationsProcess.			self runLoop.			process := nil]		named: self runLoopName! !

!RsrStreamChannelLoop methodsFor!
stoppedState	^#Stop! !

!RsrStreamChannelLoop methodsFor!
initialize	super initialize.	state := self stoppedState! !

!RsrStreamChannelLoop methodsFor!
channel: aChannel	channel := aChannel! !

!RsrStreamChannelLoop methodsFor!
runningState	^#Running! !

!RsrStreamChannelLoop methodsFor!
report: aCommand	aCommand reportOn: self log! !

!RsrStreamChannelLoop methodsFor!
runLoop	[self isActive]		whileTrue:			[[self executeCycle]				on: Error				do:					[:ex |					self reportException: ex.					self channel genericError: ex]]! !

!RsrStreamChannelLoop methodsFor!
isActive	^state == self runningState! !

!RsrStreamChannelLoop methodsFor!
log	^RsrLogWithPrefix		prefix: self class name asString		log: self channel log! !

!RsrStreamChannelLoop methodsFor!
reportException: anException	self log: anException description! !

!RsrStreamChannelLoop methodsFor!
channel	^channel! !

!RsrStreamChannelLoop methodsFor!
runLoopName	"Return the name of the associated run loop.	This name is assigned to the Process used to execute the run loop."	^self subclassResponsibility! !

!RsrGciInitiateConnection methodsFor!
token: aToken	"Stores the token used during handshake."	token := aToken! !

!RsrGciInitiateConnection methodsFor!
handshakeSteps	"Returns a sequence of steps needed to perform a successful handshake."	^Array		with: RsrProtocolVersionNegotiationClient new		with: (RsrTokenSender token: self token)! !

!RsrGciInitiateConnection methodsFor!
token	"Returns the token used during handshake."	^token! !

!RsrProtocolVersionNegotiationServer methodsFor!
performOver: aStream	"Peform the Server's side of the handshake."	| supportedVersions |	supportedVersions := self codec decode: aStream.	(supportedVersions versions includes: 1)		ifTrue:			[self codec				encodeChosenVersion: (RsrChosenVersion version: 1)				onto: aStream.			aStream flush]		ifFalse:			[self codec				encodeNoVersionOverlap: RsrNoVersionOverlap new				onto: aStream.			aStream flush; close.			^RsrProtocolVersionNegotiationFailed signal: 'Client versions did not overlap w/ Server']! !

!RsrRemoteError methodsFor!
originalClassName	^originalClassName! !

!RsrRemoteError methodsFor!
stack: aString	stack := aString! !

!RsrRemoteError methodsFor!
originalClassName: aSymbol	originalClassName := aSymbol! !

!RsrRemoteError methodsFor!
stack	^stack! !

!RsrDeliverResponse methodsFor!
reportOn: aLog	aLog debug: 'RsrDeliverResponse(', self response class name, ')'! !

!RsrDeliverResponse methodsFor!
executeFor: aConnection	| pendingMessage result servicesStrongly |	pendingMessage := aConnection pendingMessages		                  removeKey: self transaction		                  ifAbsent: [ 		                  ^ self reportUnknownTransactionIn: aConnection ].	"Must keep a strong reference to each service until the roots are referenced."	[ 	servicesStrongly := self reifyAllIn: aConnection.	result := self responseReference resolve: aConnection.	"result should now be the root of the services graph"	servicesStrongly := nil.	result first == #fulfill		ifTrue: [ pendingMessage promise fulfill: result last ]		ifFalse: [ pendingMessage promise break: result last ] ]		on: Error		do: [ :ex | 			pendingMessage promise break:				(RsrDecodingRaisedException exception: ex) ]! !

!RsrDeliverResponse methodsFor!
response: anObject	^self responseReference: anObject! !

!RsrDeliverResponse methodsFor!
reportUnknownTransactionIn: aConnection	aConnection log error: 'Unknown transaction (', self transaction asString, ') while processing Response'! !

!RsrDeliverResponse methodsFor!
responseReference	^responseReference! !

!RsrDeliverResponse methodsFor!
response	^self responseReference! !

!RsrDeliverResponse methodsFor!
encode: aStreamusing: anEncoder	anEncoder		encodeDeliverResponse: self		onto: aStream! !

!RsrDeliverResponse methodsFor!
responseReference: aReference	responseReference := aReference! !

!RsrInternalConnectionSpecification methodsFor!
connect	"Establish an internal Connection pair."	self subclassResponsibility! !

!RsrInternalConnectionSpecification methodsFor!
connectionA	^connectionA! !

!RsrInternalConnectionSpecification methodsFor!
connectionA: anObject	^ connectionA := anObject! !

!RsrInternalConnectionSpecification methodsFor!
assertOpen	"Assert that connectionA and connectionB are open.	Signal RsrConnectionFailed if they are not."	(connectionA isOpen and: [connectionB isOpen])		ifFalse: [RsrConnectionFailed signal]! !

!RsrInternalConnectionSpecification methodsFor!
connectionB: anObject	connectionB := anObject! !

!RsrInternalConnectionSpecification methodsFor!
connectionB	^connectionB! !

!RsrRemoteException methodsFor!
tag	^tag! !

!RsrRemoteException methodsFor!
isRemoteException	"This is a RemoteException reason"	^true! !

!RsrRemoteException methodsFor!
messageText: aString	messageText := aString! !

!RsrRemoteException methodsFor!
printOn: aStream	aStream		nextPutAll: exceptionClassName;		cr;		nextPutAll: messageText;		cr;		nextPutAll: '===================';		cr;		nextPutAll: stack! !

!RsrRemoteException methodsFor!
tag: aString	tag := aString! !

!RsrRemoteException methodsFor!
exceptionClassName	^exceptionClassName! !

!RsrRemoteException methodsFor!
messageText	^messageText! !

!RsrRemoteException methodsFor!
stack	^stack! !

!RsrRemoteException methodsFor!
stack: aString	stack := aString! !

!RsrRemoteException methodsFor!
exceptionClassName: aSymbol	exceptionClassName := aSymbol! !

!RsrChannel methodsFor!
isConnected	"Report whether the Channel is open between Connections."	^self subclassResponsibility! !

!RsrChannel methodsFor!
log	^self connection log! !

!RsrChannel methodsFor!
connection	^connection! !

!RsrChannel methodsFor!
close	"Ensure the channel is closed to further communication."	^self subclassResponsibility! !

!RsrChannel methodsFor!
genericError: anError	^self connection unknownError: anError! !

!RsrChannel methodsFor!
open	"Ensure the channel is open and ready for communication."	^self subclassResponsibility! !

!RsrChannel methodsFor!
send: aCommand	"Send the provided command over the channel."	^self subclassResponsibility! !

!RsrChannel methodsFor!
received: aCommand	"A command has come in over the channel. Propogate it to the Connection."	self connection _receivedCommand: aCommand! !

!RsrChannel methodsFor!
connection: aConnection	connection := aConnection! !

!RsrHandshake methodsFor!
steps	"The sequence of handshake steps to perform."	^steps! !

!RsrHandshake methodsFor!
stream	"The stream used by each step."	^stream! !

!RsrHandshake methodsFor!
steps: anArrayOfSteps	"The sequence of handshake steps to perform."	steps := anArrayOfSteps! !

!RsrHandshake methodsFor!
stream: aStream	"The stream used by each step."	stream := aStream! !

!RsrHandshake methodsFor!
perform	"Perform the sequence of configured steps."	self steps do: [:each | each performOver: self stream]! !

!RsrBufferedSocketStream methodsFor!
next	^self next: 1! !

!RsrBufferedSocketStream methodsFor!
growOutBufferTo: aNumberOfBytes	| rounding |	rounding := ((aNumberOfBytes \\ 4096) + 1) * 4096.	outBuffer := outBuffer , (ByteArray new: rounding - outBuffer size)! !

!RsrBufferedSocketStream methodsFor!
close	stream close! !

!RsrBufferedSocketStream methodsFor!
flush	writePosition = nextToWrite		ifTrue: [^self].	stream nextPutAll: (outBuffer copyFrom: writePosition to: nextToWrite - 1).	writePosition := nextToWrite := 1.	stream flush! !

!RsrBufferedSocketStream methodsFor!
atEnd	^stream atEnd! !

!RsrBufferedSocketStream methodsFor!
initialize	super initialize.	outBuffer := ByteArray new: 4096.	nextToWrite := 1.	writePosition := 1! !

!RsrBufferedSocketStream methodsFor!
isConnected	^stream isConnected! !

!RsrBufferedSocketStream methodsFor!
nextPutAll: aByteArray	(outBuffer size >= (aByteArray size + nextToWrite))		ifFalse: [self growOutBufferTo: outBuffer size + nextToWrite].	outBuffer		replaceFrom: nextToWrite		to: nextToWrite + aByteArray size - 1		with: aByteArray		startingAt: 1.	nextToWrite := nextToWrite + aByteArray size.	self checkAutoFlush! !

!RsrBufferedSocketStream methodsFor!
stream: aStream	stream := aStream! !

!RsrBufferedSocketStream methodsFor!
next: aCount	^stream next: aCount! !

!RsrBufferedSocketStream methodsFor!
checkAutoFlush	nextToWrite > 4096		ifTrue: [ self flush ]! !

!RsrSocketConnectionSpecification methodsFor!
port: aPort	"The port number used for establishing a socket"	port := aPort! !

!RsrSocketConnectionSpecification methodsFor!
port	"The port number used for establishing a socket"	^port! !

!RsrSocketConnectionSpecification methodsFor!
socketClass	"Return the class that should be used for creating Socket instances."	^RsrSocket! !

!RsrSocketConnectionSpecification methodsFor!
host: hostnameOrAddress	"The hostname or IP address used to establish a connection."	host := hostnameOrAddress! !

!RsrSocketConnectionSpecification methodsFor!
host	"Return the configured hostname or IP address"	^host! !

!RsrInitiateConnection methodsFor!
connect	| socket stream handshake channel connection |	socket := self socketClass new.	socket		connectToHost: self host		port: self port.	stream := RsrSocketStream on: socket.	handshake := RsrHandshake		steps: self handshakeSteps		stream: stream.	handshake perform.	channel := RsrBinaryStreamChannel		inStream: stream		outStream: stream.	connection := RsrConnection		specification: self		channel: channel		transactionSpigot: RsrThreadSafeNumericSpigot naturals negated		oidSpigot: RsrThreadSafeNumericSpigot naturals negated.	^connection open! !

!RsrInitiateConnection methodsFor!
handshakeSteps	"Returns a sequence of steps needed to perform a successful handshake."	^Array		with: RsrProtocolVersionNegotiationClient new! !

!RsrCommand methodsFor!
executeFor: aConnection	self subclassResponsibility! !

!RsrCommand methodsFor!
reportOn: aLog	self subclassResponsibility! !

!RsrCommand methodsFor!
encode: aStreamusing: anEncoder	self subclassResponsibility! !

!RsrThreadSafeNumericSpigot methodsFor!
initialize	super initialize.	mutex := Semaphore forMutualExclusion! !

!RsrThreadSafeNumericSpigot methodsFor!
next	^mutex critical: [super next]! !

!RsrPromise methodsFor!
isResolved	"Report if the receiver is currently resolved."	^self isFulfilled or: [self isBroken]! !

!RsrPromise methodsFor!
when: aWhenBlockcatch: aCatchBlock	"Activate an appropriate block when the receiver is resolved.	If the receiver is currently resolved, schedule the block activation.	The block is activated in a new thread. The thread is not given any specific	error handler.	<aWhenBlock> will be sent #value: with the same value provided to #fulfill:.	<aCatchBlock> will be sent #value: with the same reason provided to #break:."	| action shouldNotifyActions |	action := RsrPromiseResolutionAction		when: aWhenBlock		catch: aCatchBlock.	mutex		critical:			[shouldNotifyActions := self isResolved.			resolutionActions add: action].	shouldNotifyActions ifTrue: [self notifyActions]! !

!RsrPromise methodsFor!
wait	"Wait for a the receiver to be Resolved.	If fulfilled - return the fulfillment value.	If broken - raise an RsrBrokenPromise exception w/ the reason."	self waitForResolution.	^self isBroken		ifTrue: [RsrBrokenPromise signalReason: value]		ifFalse: [value]! !

!RsrPromise methodsFor!
fulfill: anObject	"Fulfill the receiver and notify any observers."	mutex		critical:			[self assertNotResolved.			value := anObject.			state := #Fulfilled].	self notifyActions.	resolvedMutex signal! !

!RsrPromise methodsFor!
notifyActions	"Activate any registered action's fulfillment blocks.	Ensure that they are activated only once and that	future actions are allowed."	| actions |	mutex		critical:			[actions := resolutionActions.			resolutionActions := OrderedCollection new].	actions		do:			[:each |			self isFulfilled				ifTrue: [RsrProcessModel fork: [each when value: value] named: 'Promise Fulfillment Notification']				ifFalse: [RsrProcessModel fork: [each catch value: value] named: 'Promise Break Notification']]! !

!RsrPromise methodsFor!
value	"Alias for #wait"	^self wait! !

!RsrPromise methodsFor!
initialize	super initialize.	mutex := Semaphore forMutualExclusion.	resolvedMutex := Semaphore new.	state := #PendingResolution.	resolutionActions := OrderedCollection new! !

!RsrPromise methodsFor!
break: aReason	"Notify the receiver's observers that the Promise will not be fulfilled."	mutex		critical:			[self assertNotResolved.			value := aReason.			state := #Broken].	self notifyActions.	resolvedMutex signal! !

!RsrPromise methodsFor!
isBroken	"Report if the receiver is currently broken"	^state == #Broken! !

!RsrPromise methodsFor!
isFulfilled	"Report is the receiver is currently fulfilled"	^state == #Fulfilled! !

!RsrPromise methodsFor!
assertNotResolved	self isResolved		ifTrue: [RsrAlreadyResolved signal].! !

!RsrPromise methodsFor!
waitForResolution	"There doesn't seem to be a great way to implement this method.	The ensure below is generally safe but does have a side-effect of signaling	the mutex when the process is terminated while waiting.	Removing the ensure allows the signal to be lost if the process is terminated	just after #wait but before #signal is processed.	In order to solve this, the loop verifies the promise is actually resolved before	continuing."	self isResolved		ifTrue: [^self].	[[self isResolved] whileFalse: [resolvedMutex wait]] ensure: [resolvedMutex signal]! !

!RsrService methodsFor!
isServer	^self class isServerClass! !

!RsrService methodsFor!
serviceSchedulingPriority	^Processor userSchedulingPriority! !

!RsrService methodsFor!
isClient	^self class isClientClass! !

!RsrService methodsFor!
synchronize	"Synchronize the service w/ its peer."	remoteSelf == nil		ifFalse: [remoteSelf _synchronize wait]! !

!RsrService methodsFor!
registerWith: aConnection	aConnection _ensureRegistered: self! !

!RsrService methodsFor!
_id	"Private - Returns the Service ID associated w/ the receiver."	^_id! !

!RsrService methodsFor!
debug: anExceptionraisedDuring: aMessageSendanswerUsing: aResolver	aResolver break: (RsrRemoteException from: anException)! !

!RsrService methodsFor!
id	"Returns the Service ID associated w/ the receiver."	^self _id! !

!RsrService methodsFor!
postUpdate	"#postUpdate is called just after the Service's shared variables are updated by the framework.	This method can be overridden to ensure internal consistency."	^self! !

!RsrService methodsFor!
_id: anRsrIdconnection: aConnection	"Private - Configure this Service w/ a Service ID and Connection. This is a side-effect of registering a Service w/ a Connection."	_id := anRsrId.	_connection := aConnection.	remoteSelf := aConnection _forwarderClass on: self! !

!RsrService methodsFor!
isMirrored	^_connection ~~ nil! !

!RsrService methodsFor!
_synchronize	"Return self to synchronize with the remote peer"	^self! !

!RsrService methodsFor!
preUpdate	"#preUpdate is called just before the Service's shared variables are updated by the framework.	This method can be overridden to ensure internal consistency.	Note: If this method raises an exception, RSR will not signal #postUpdate."	^self! !

!RsrService methodsFor!
configureProcess	"#configureProcess is called each time the framework calls into the framework to evaluate generic user code.	#preUpdate and #postUpdate run in a configuration manner prescribed by the framework."	Processor activeProcess		priority: self serviceSchedulingPriority! !

!RsrService methodsFor!
_connection	"Private - Returns the Connection associated w/ the receiver."	^_connection! !

!RsrService methodsFor!
connection	"Returns the Connection associated w/ the receiver."	^self _connection! !

!RsrService methodsFor!
isNotMirrored	^self isMirrored not! !

!RsrCommandDecoder methodsFor!
instanceOfImmediate: aReferenceType	aReferenceType = 1		ifTrue: [^RsrSymbolReference new].	aReferenceType = 2		ifTrue: [^RsrStringReference new].	aReferenceType = 3		ifTrue: [^RsrPositiveIntegerReference new].	aReferenceType = 4		ifTrue: [^RsrNegativeIntegerReference new].	aReferenceType = 5		ifTrue: [^RsrCharacterReference new].	aReferenceType = 6		ifTrue: [^RsrNilReference new].	aReferenceType = 7		ifTrue: [^RsrTrueReference new].	aReferenceType = 8		ifTrue: [^RsrFalseReference new].	aReferenceType = 9		ifTrue: [^RsrArrayReference new].	aReferenceType = 10		ifTrue: [^RsrByteArrayReference new].	aReferenceType = 11		ifTrue: [^RsrSetReference new].	aReferenceType = 12		ifTrue: [^RsrOrderedCollectionReference new].	aReferenceType = 13		ifTrue: [^RsrDictionaryReference new].	aReferenceType = 14		ifTrue: [^RsrDateAndTimeReference new].	aReferenceType = 15		ifTrue: [^RsrDoubleReference new].	self error: 'ReferenceType(', aReferenceType printString, ') not yet implemented'.! !

!RsrCommandDecoder methodsFor!
decodeReleaseServices: aStream	| count oids |	count := self decodeControlWord: aStream.	oids := Array new: count.	1		to: count		do:			[:i | | oid |			oid := self decodeControlWord: aStream.			oids at: i put: oid].	^RsrReleaseServices sids: oids! !

!RsrCommandDecoder methodsFor!
decodeReference: aStream	| oid |	oid := self decodeControlWord: aStream.	oid = self immediateOID ifTrue: [^self decodeImmediateReference: aStream].	^RsrServiceReference sid: oid! !

!RsrCommandDecoder methodsFor!
decodeServiceSnapshot: aStream	| snapshot |	snapshot := RsrServiceSnapshot new.	snapshot		decode: aStream		using: self.	^snapshot! !

!RsrCommandDecoder methodsFor!
decodeImmediateReference: aStream	| referenceType |	referenceType := self decodeControlWord: aStream.	^(self instanceOfImmediate: referenceType)		decode: aStream		using: self! !

!RsrCommandDecoder methodsFor!
decodeDeliverResponse: aStream    | transaction numServices serviceSnapshots response |    transaction := self decodeControlWord: aStream.    numServices := self decodeControlWord: aStream.    serviceSnapshots := (1 to: numServices) collect: [:each | self decodeServiceSnapshot: aStream].    response := self decodeReference: aStream.    ^RsrDeliverResponse new        transaction: transaction;        snapshots: serviceSnapshots;        response: response;        yourself! !

!RsrCommandDecoder methodsFor!
decodeCommand: aStream	"Decode an object from the stream"	| command |	command := self decodeControlWord: aStream.	command == self sendMessageCommand ifTrue: [^self decodeSendMessage: aStream].	command == self deliverResponseCommand ifTrue: [^self decodeDeliverResponse: aStream].	command == self releaseObjectsCommand ifTrue: [^self decodeReleaseServices: aStream].	^RsrError signal: 'Unknown command identifier: ', command printString! !

!RsrCommandDecoder methodsFor!
decodeSendMessage: aStream	| transaction argCount receiverReference selector numServices serviceSnapshots arguments instance |	transaction := self decodeControlWord: aStream.	numServices := self decodeControlWord: aStream.	serviceSnapshots := (1 to: numServices) collect: [:each | self decodeServiceSnapshot: aStream].	receiverReference := self decodeReference: aStream.	selector := self decodeReference: aStream.	argCount := self decodeControlWord: aStream.	arguments := (1 to: argCount) collect: [:each | self decodeReference: aStream].	instance := RsrSendMessage		transaction: transaction		receiverReference: receiverReference		selectorReference: selector		argumentReferences: arguments.	instance snapshots: serviceSnapshots.	^instance! !

!RsrSnapshotAnalysis methodsFor!
roots: anArray	roots := anArray! !

!RsrSnapshotAnalysis methodsFor!
snapshot: aService	snapshots add: (RsrServiceSnapshot from: aService)! !

!RsrSnapshotAnalysis methodsFor!
analyzedObjects	^ analyzedObjects! !

!RsrSnapshotAnalysis methodsFor!
snapshots	^snapshots! !

!RsrSnapshotAnalysis methodsFor!
analyzeDictionary: aDictionary	aDictionary keysAndValuesDo: [ :key :value | 		self			analyze: key;			analyze: value ].	^ aDictionary! !

!RsrSnapshotAnalysis methodsFor!
analyzeImmediate: anImmediateObject	^anImmediateObject! !

!RsrSnapshotAnalysis methodsFor!
analyze: anObject	(analyzedObjects includes: anObject) ifTrue: [ ^ self ].	analyzedObjects add: anObject.	^ (self referenceClassFor: anObject) analyze: anObject using: self! !

!RsrSnapshotAnalysis methodsFor!
ensureRegistered: aService	self connection _ensureRegistered: aService.	aService isServer		ifTrue: [self connection _stronglyRetain: aService]! !

!RsrSnapshotAnalysis methodsFor!
snapshots: anOrderedCollection	snapshots := anOrderedCollection! !

!RsrSnapshotAnalysis methodsFor!
initialize	super initialize.	snapshots := OrderedCollection new.	analyzedObjects := IdentitySet new! !

!RsrSnapshotAnalysis methodsFor!
connection: aConnection	connection := aConnection! !

!RsrSnapshotAnalysis methodsFor!
analyzeCollection: aCollection	aCollection do: [ :each | self analyze: each ].	^ aCollection! !

!RsrSnapshotAnalysis methodsFor!
roots	^roots! !

!RsrSnapshotAnalysis methodsFor!
analyzeService: aService	self ensureRegistered: aService.	RsrServiceSnapshot		reflectedVariablesFor: aService		do: [ :each | self analyze: each ].	snapshots add: (RsrServiceSnapshot from: aService)! !

!RsrSnapshotAnalysis methodsFor!
referenceClassFor: anObject	^RsrReference referenceClassFor: anObject! !

!RsrSnapshotAnalysis methodsFor!
connection	^connection! !

!RsrSnapshotAnalysis methodsFor!
perform	roots do: [:each | self analyze: each]! !