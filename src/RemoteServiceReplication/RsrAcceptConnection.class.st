Class {
	#name : 'RsrAcceptConnection',
	#superclass : 'RsrSocketConnectionSpecification',
	#instVars : [
		'listener',
		'isListening',
		'isWaitingForConnection'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrAcceptConnection class >> port: aPortInteger [

	^super
		host: self wildcardAddress
		port: aPortInteger
]

{ #category : 'accessing' }
RsrAcceptConnection class >> wildcardAddress [

	^'0.0.0.0'
]

{ #category : 'accessing' }
RsrAcceptConnection class >> wildcardPort [

	^0
]

{ #category : 'actions' }
RsrAcceptConnection >> cancelWaitForConnection [

	listener ifNotNil: [:socket | socket close]
]

{ #category : 'actions' }
RsrAcceptConnection >> ensureListening [

	isListening ifTrue: [^self].
	listener
		bindAddress: self host
		port: self port.
	listener listen: 1.
	isListening := true
]

{ #category : 'accessing' }
RsrAcceptConnection >> handshakeSteps [
	"Returns a sequence of steps needed to perform a successful handshake."

	^Array
		with: RsrProtocolVersionNegotiationResponder new
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
	stream := RsrSocketStream on: socket.
	handshake := RsrHandshake
		steps: self handshakeSteps
		stream: stream.
	handshake perform.
	channel := RsrByteChannel
		inStream: stream
		outStream: stream.
	connection := RsrSession
		specification: self
		channel: channel
		transactionSpigot: RsrThreadSafeNumericSpigot naturals
		oidSpigot: RsrThreadSafeNumericSpigot naturals.
	^connection open
]
