Class {
	#name : 'RsrTlsConnectionAcceptor',
	#superclass : 'RsrObject',
	#instVars : [
		'host',
		'address',
		'port',
		'listener',
		'isListening',
		'isWaitingForConnection',
		'handshake',
		'certPath',
		'keyPath'
	],
	#category : 'RemoteServiceReplication-Factory-GemStone'
}

{ #category : 'instance creation' }
RsrTlsConnectionAcceptor class >> address: address
port: port
handshake: requiredHandshake
certPath: certPath
keyPath: keyPath [

	^self new
		address: address;
		port: port;
		handshake: requiredHandshake;
		certPath: certPath;
		keyPath: keyPath;
		yourself
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> address [
	"Host address to listen on"

	^address
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> address: addressString [
	"Host address to listen on"

	address := addressString
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> certPath [
	"TLS Certificate Path"

	^certPath
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> certPath: certPathString [
	"TLS Certificate Path"

	certPath := certPathString
]

{ #category : 'actions' }
RsrTlsConnectionAcceptor >> ensureListening [

	isListening ifTrue: [^self].
	[listener
		bindTo: self port
		toAddress: self address]
		on: SocketError, OutOfRange
		do: [:ex | ex resignalAs: (RsrInvalidBind new messageText: ex messageText)].
	listener makeListener: 1.
	isListening := true
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> handshake [
	"Handshake required to successfully accept a Connection."

	^handshake
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> handshake: requiredHandshake [
	"Handshake required to successfully accept a Connection."

	handshake := requiredHandshake
]

{ #category : 'initializing' }
RsrTlsConnectionAcceptor >> initialize [

	super initialize.
	listener := self socketClass newServerIpv6.
	isWaitingForConnection := false.
	isListening := false
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> keyPath [
	"TLS Private Key Path"

	^keyPath
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> keyPath: keyPathString [
	"TLS Private Key Path"

	keyPath := keyPathString
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> port [
	"Listening port"

	^port
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> port: portNumber [
	"Listening port"

	port := portNumber
]

{ #category : 'accessing' }
RsrTlsConnectionAcceptor >> socketClass [
	"Return the class that should be used for creating Socket instances."

	^GsSecureSocket
]

{ #category : 'actions' }
RsrTlsConnectionAcceptor >> waitForConnection [

	| socket stream channel connection |
	self ensureListening.
	[isWaitingForConnection := true.
	socket := [listener accept]
		on: SocketError
		do: [:ex | ex resignalAs: RsrWaitForConnectionCancelled new]]
			ensure:
				[listener close.
				listener := nil.
				isWaitingForConnection := false].
	socket
		useCertificateFile: self certPath
		withPrivateKeyFile: self keyPath
		privateKeyPassphrase: nil.
	socket secureAccept.
	stream := RsrGsSocketStream on: socket.
	handshake performOver: stream.
	channel := RsrBinaryStreamChannel
		inStream: stream
		outStream: stream.
	connection := RsrConnection
		specification: self
		channel: channel
		transactionSpigot: RsrThreadSafeNumericSpigot naturals
		oidSpigot: RsrThreadSafeNumericSpigot naturals.
	^connection open
]
