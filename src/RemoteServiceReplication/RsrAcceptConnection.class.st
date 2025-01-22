Class {
	#name : 'RsrAcceptConnection',
	#superclass : 'RsrSocketConnectionSpecification',
	#instVars : [
		'portRange',
		'listener',
		'isListening',
		'isWaitingForConnection'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrAcceptConnection class >> host: hostnameOrAddress port: portNumber [

	^ self new
		  host: hostnameOrAddress;
		  portRange: (portNumber to: portNumber);
		  yourself
]

{ #category : 'instance creation' }
RsrAcceptConnection class >> host: hostnameOrAddress portRange: anInterval [

	^ self new
		  host: hostnameOrAddress;
		  portRange: anInterval;
		  yourself
]

{ #category : 'instance creation' }
RsrAcceptConnection class >> port: aPortInteger [

	^ self host: self wildcardAddress port: aPortInteger
]

{ #category : 'instance creation' }
RsrAcceptConnection class >> portRange: anInterval [

	^ self host: self wildcardAddress portRange: anInterval
]

{ #category : 'accessing' }
RsrAcceptConnection class >> wildcardAddress [

	^'0.0.0.0'
]

{ #category : 'accessing' }
RsrAcceptConnection class >> wildcardPort [

	^0
]

{ #category : 'private' }
RsrAcceptConnection >> bind [

	"Attempt to listen on each of the port range, answer the successful port or signal RsrInvalidBind"

	portRange do: [ :portToTry | 
		[ 
		listener bindAddress: self host port: portToTry.
		^ portToTry ]
			on: RsrInvalidBind
			do: [ :ex | ex return ] ].
	RsrInvalidBind signal:
		'Cannot bind to any port in range ' , portRange printString
]

{ #category : 'actions' }
RsrAcceptConnection >> cancelWaitForConnection [

	listener ifNotNil: [:socket | socket close]
]

{ #category : 'actions' }
RsrAcceptConnection >> ensureListening [

	isListening ifTrue: [^self].
	self bind.
	listener listen: 5.
	isListening := true
]

{ #category : 'accessing' }
RsrAcceptConnection >> handshakeSteps [
	"Returns a sequence of steps needed to perform a successful handshake."

	^Array
		with: RsrProtocolVersionNegotiationServer new
]

{ #category : 'other' }
RsrAcceptConnection >> initialize [

	super initialize.
	listener := self socketClass new.
	isWaitingForConnection := false.
	isListening := false
]

{ #category : 'testing' }
RsrAcceptConnection >> isWaitingForConnection [

	^isWaitingForConnection
]

{ #category : 'accessing' }
RsrAcceptConnection >> listeningPort [
	"Return the port the underlying socket is listening on.
	This is useful when using the wildcard port to dynamically
	assign a port number."

	isListening ifFalse: [^nil].
	^listener port
]

{ #category : 'accessing' }
RsrAcceptConnection >> portRange [

	^ portRange
]

{ #category : 'accessing' }
RsrAcceptConnection >> portRange: anObject [

	portRange := anObject
]

{ #category : 'actions' }
RsrAcceptConnection >> waitForConnection [

	| socket stream handshake channel connection |
	self ensureListening.
	[isWaitingForConnection := true.
	socket := [listener accept]
		on: RsrSocketError
		do: [:ex | ex resignalAs: RsrWaitForConnectionCancelled new]]
			ensure:
				[listener close.
				listener := nil.
				isWaitingForConnection := false].
	stream := socket bufferedSocketStream.
	handshake := RsrHandshake
		steps: self handshakeSteps
		stream: stream.
	handshake perform.
	channel := RsrBinaryStreamChannel
		wireProtocol: RsrWireProtocolV2 new
		inStream: stream
		outStream: stream.
	connection := RsrConnection
		specification: self
		channel: channel
		transactionSpigot: RsrThreadSafeNumericSpigot naturals
		oidSpigot: RsrThreadSafeNumericSpigot naturals.
	^connection open
]
