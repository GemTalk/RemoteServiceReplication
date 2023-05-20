"
A stream to put on top of a socket, with a write buffer to avoid sending tiny packets. Bytes are accumulated until either an MSS-worth (we assume a conservative MSS of 1440 bytes) is waiting to be sent, or until flush is sent, to send the data through the underlying socket.
"
Class {
	#name : 'RsrSocketStream',
	#superclass : 'RsrStream',
	#instVars : [
		'socket',
		'sendBuffer',
		'position'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrSocketStream class >> on: anRsrSocket [

	^self new
		socket: anRsrSocket;
		yourself
]

{ #category : 'testing' }
RsrSocketStream >> atEnd [
	"Return whether additional bytes could become available on the socket."

	^socket isConnected not
]

{ #category : 'accessing' }
RsrSocketStream >> bufferSize [
	"The most bytes we'll send to the underlying socket at once, or 
	attempt to read from the underlying socket at one time."

	^65536
]

{ #category : 'closing' }
RsrSocketStream >> close [

	socket close
]

{ #category : 'adding' }
RsrSocketStream >> flush [

	"Write buffered bytes to the socket"

	| allBytesWritten |
	allBytesWritten := 0.
	[ allBytesWritten < position ] whileTrue: [ 
		| bytesWritten |
		bytesWritten := socket
			                write: position - allBytesWritten
			                from: sendBuffer
			                startingAt: allBytesWritten + 1.
		allBytesWritten := allBytesWritten + bytesWritten ].
	position := 0
]

{ #category : 'initializing' }
RsrSocketStream >> initialize [

	super initialize.
	sendBuffer := ByteArray new: self bufferSize.
	self reset
]

{ #category : 'accessing' }
RsrSocketStream >> next [
	"Return the next byte"

	^self next: 1
]

{ #category : 'accessing' }
RsrSocketStream >> next: count [

	"Return exactly <count> number of bytes.
	Signal RsrSocketClosed if the socket closes."

	| chunkSize bytes totalRead numRead |
	chunkSize := self bufferSize.
	bytes := ByteArray new: count.
	totalRead := 0.
	[ totalRead < count ] whileTrue: [ 
		numRead := socket
			           read: (chunkSize min: count - totalRead)
			           into: bytes
			           startingAt: totalRead + 1.
		totalRead := totalRead + numRead ].
	^ bytes
]

{ #category : 'adding' }
RsrSocketStream >> nextPut: aByte [

	position = sendBuffer size ifTrue: [ self flush ].
	position := position + 1.
	sendBuffer at: position put: aByte
]

{ #category : 'adding' }
RsrSocketStream >> nextPutAll: bytes [

	"Write <bytes> to the buffer, sending to socket if the buffer fills."

	| numPut yetToPut |
	numPut := 0.
	[ 
	yetToPut := bytes size - numPut.
	yetToPut > 0 ] whileTrue: [ 
		| copyCount |
		copyCount := yetToPut min: sendBuffer size - position.
		sendBuffer
			replaceFrom: position + 1
			to: position + copyCount
			with: bytes
			startingAt: numPut + 1.
		position := position + copyCount.
		position = sendBuffer size ifTrue: [ self flush ].
		numPut := numPut + copyCount ]
]

{ #category : 'accessing' }
RsrSocketStream >> reset [

	position := 0
]

{ #category : 'accessing' }
RsrSocketStream >> socket: anRsrSocket [

	socket := anRsrSocket
]
