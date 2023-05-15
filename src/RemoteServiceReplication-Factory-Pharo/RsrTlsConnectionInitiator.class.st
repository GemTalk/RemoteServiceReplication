Class {
	#name : 'RsrTlsConnectionInitiator',
	#superclass : 'RsrObject',
	#instVars : [
		'host',
		'port',
		'handshake'
	],
	#category : 'RemoteServiceReplication-Factory-Pharo'
}

{ #category : 'instance creation' }
RsrTlsConnectionInitiator class >> host: hostName
port: portNumber
handshake: aHandshake [

	^self new
		host: hostName;
		port: portNumber;
		handshake: aHandshake;
		yourself
]

{ #category : 'connecting' }
RsrTlsConnectionInitiator >> connect [

	| stream channel connection |
	stream := ZdcSecureSocketStream 
		openConnectionToHostNamed: self host
		port: self port.
	stream connect.
	stream timeout: SmallInteger maxVal.
	handshake performOver: stream.
	channel := RsrByteChannel
		inStream: stream
		outStream: stream.
	connection := RsrSession
		specification: self
		channel: channel
		transactionSpigot: RsrThreadSafeNumericSpigot naturals negated
		oidSpigot: RsrThreadSafeNumericSpigot naturals negated.
	^connection open
]

{ #category : 'accessing' }
RsrTlsConnectionInitiator >> handshake [

	^ handshake
]

{ #category : 'accessing' }
RsrTlsConnectionInitiator >> handshake: anObject [

	handshake := anObject
]

{ #category : 'accessing' }
RsrTlsConnectionInitiator >> host [

	^ host
]

{ #category : 'accessing' }
RsrTlsConnectionInitiator >> host: anObject [

	host := anObject
]

{ #category : 'accessing' }
RsrTlsConnectionInitiator >> port [

	^ port
]

{ #category : 'accessing' }
RsrTlsConnectionInitiator >> port: anObject [

	port := anObject
]
