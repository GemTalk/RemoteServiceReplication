Class {
	#name : 'RsrSocketStream',
	#superclass : 'RsrStream',
	#instVars : [
		'socket'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
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
RsrSocketStream >> chunkSize [
	"The largest size that should be read from or written to a Socket in each attempt."

	^4096
]

{ #category : 'closing' }
RsrSocketStream >> close [

	socket close
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

	| chunkSize bytes position numRead |
	chunkSize := self chunkSize.
	bytes := ByteArray new: count.
	position := 1.
	[position <= count]
		whileTrue:
			[numRead := socket
				read: (chunkSize min: count - position + 1)
				into: bytes
				startingAt: position.
			position := position + numRead].
	^bytes
]

{ #category : 'adding' }
RsrSocketStream >> nextPutAll: bytes [
	"Write <bytes> to the socket."

	| chunkSize position numBytes numWritten |
	chunkSize := self chunkSize.
	position := 1.
	numBytes := bytes size.
	[position <= numBytes]
		whileTrue:
			[numWritten := socket
				write: (chunkSize min: numBytes - position + 1)
				from: bytes
				startingAt: position.
			position := position + numWritten]
]

{ #category : 'accessing' }
RsrSocketStream >> socket: anRsrSocket [

	socket := anRsrSocket
]
