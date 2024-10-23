Class {
	#name : 'RsrSocket',
	#superclass : 'RsrObject',
	#instVars : [
		'nativeSocket'
	],
	#category : 'RemoteServiceReplication-Pharo',
	#package : 'RemoteServiceReplication-Pharo'
}

{ #category : 'instance creation' }
RsrSocket class >> _nativeSocket: aSocket [
	"Private - Create a instance backed by the provided Pharo Socket"

	^self basicNew
		_nativeSocket: aSocket;
		yourself
]

{ #category : 'private-accessing' }
RsrSocket >> _nativeSocket: aSocket [
	"Private - Configure w/ a platform socket"

	aSocket setOption: 'TCP_NODELAY' value: 1.
	nativeSocket := aSocket
]

{ #category : 'accepting connections' }
RsrSocket >> accept [
	"Return an RsrSocket which is connected to a peer. In the event that the socket is closed while waiting, signal RsrSocketClosed."

	| timeoutHandler ns |
	timeoutHandler :=
		[nativeSocket isValid
			ifTrue: [nil]
			ifFalse: [RsrSocketClosed signal: 'Socket closed during #accept']].
	[ns isNil]
		whileTrue:
			[ns := nativeSocket
				waitForAcceptFor: 2
				ifTimedOut: timeoutHandler].
	^self class _nativeSocket: ns
]

{ #category : 'private-asserting' }
RsrSocket >> assertConnected [
	"Throw an RsrSocketClosed if <nativeSocket> is not in a connected state."

	nativeSocket isConnected
		ifFalse: [RsrSocketClosed signal]
]

{ #category : 'accepting connections' }
RsrSocket >> bindAddress: addressString
port: port [
	"Bind the socket to the provided port and address. Signal RsrInvalidBind in the event the bind fails."

	(port between: 0 and: 65535)
		ifFalse: [^RsrInvalidBind signal: 'Specified port (', port printString, ') is out of range.'].
	[| address |
	address := NetNameResolver addressForName: addressString.
	nativeSocket
		bindTo: address
		port: port]
			on: NameLookupFailure, PrimitiveFailed, InvalidSocketStatusException
			do: [:ex | ex resignalAs: (RsrInvalidBind new messageText: ex messageText)]
]

{ #category : 'terminating connections' }
RsrSocket >> close [
	"Ensure closure of the Socket and cleanup any associated resources."

	nativeSocket closeAndDestroy
]

{ #category : 'establishing connections' }
RsrSocket >> connectToHost: aHostname
port: aPort [
	"Establish a connect to the provided host and port. If the socket is unable to establish, signal RsrConnectFailed.
	If the socket is bound to an address/port, signal RsrInvalidConnect.
	<hostname> - The name or ip address of a machine which should accept a connection.
	<port> - An integer representing a valid TCP port."


	[| hostAddress |
	hostAddress := NetNameResolver addressForName: aHostname.
	nativeSocket
		connectTo: hostAddress
		port: aPort
		waitForConnectionFor: 5]
			on: NameLookupFailure, ConnectionTimedOut, InvalidSocketStatusException
			do: [:ex | ex resignalAs: (RsrConnectFailed new messageText: ex messageText)]
]

{ #category : 'initialization' }
RsrSocket >> initialize [

	super initialize.
	nativeSocket := Socket new
]

{ #category : 'testing' }
RsrSocket >> isConnected [
	"Return true if the socket is open and connected with a peer. Return false otherwise."

	^nativeSocket isConnected
]

{ #category : 'accepting connections' }
RsrSocket >> listen: backlog [
	"Starting listening for connections. <backlogLength> specifies the number of connections to allow in a pending state.
	The actual backlog may support fewer prending connections depending upon implementation."

	nativeSocket
		listenOn: nativeSocket port
		backlogSize: (backlog max: 2) "Ensure a new socket is created"
]

{ #category : 'accessing' }
RsrSocket >> port [
	"Return the port associated with the socket."

	^nativeSocket port
]

{ #category : 'reading/writing' }
RsrSocket >> read: count
into: bytes
startingAt: index [ 
	"Read <count> number of bytes into <bytes> and place the first byte into slot <index>.
	<bytes> is assumed to be at least <count + index> bytes in size.
	Return the number of bytes successfully read. Signal RsrSocketClosed if the socket is closed before or during the call."

	| tempBuffer numRead |
	self assertConnected.
	tempBuffer := ByteArray new: count.
	nativeSocket
		waitForDataFor: 1
		ifClosed: [RsrSocketClosed signal]
		ifTimedOut: [^0].
	numRead := nativeSocket receiveDataInto: tempBuffer.
	numRead = 0
		ifTrue: [RsrSocketClosed signal].
	bytes
		replaceFrom: index
		to: (index + count - 1)
		with: tempBuffer
		startingAt: 1.
	^numRead
]

{ #category : 'reading/writing' }
RsrSocket >> write: count
from: bytes
startingAt: index [
	"Write <count> number of bytes from <bytes> with <index> as the index of the first bytes.
	If <bytes> is smaller than <index + count> the behavior is undefined.
	If the socket is not connected, signal RsrSocketClosed."

	self assertConnected.
	^nativeSocket
		sendSomeData: bytes
		startIndex: index
		count: count
]
