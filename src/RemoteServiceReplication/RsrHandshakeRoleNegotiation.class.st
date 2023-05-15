Class {
	#name : 'RsrHandshakeRoleNegotiation',
	#superclass : 'RsrHandshakeStep',
	#category : 'RemoteServiceReplication'
}

{ #category : 'private' }
RsrHandshakeRoleNegotiation class >> classForChannel: aChannel [

	^ self
]

{ #category : 'handshaking' }
RsrHandshakeRoleNegotiation >> performForChannel: aChannel [

	"Peform the responder's side of the handshake."

	| readStream writeStream codec |
	readStream := aChannel readStream.
	writeStream := aChannel writeStream.
	codec := self newCodec.

	codec
		writeMagic: writeStream;
		readMagic: readStream
]
