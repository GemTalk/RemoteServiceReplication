Class {
	#name : 'RsrGsSocketStream',
	#superclass : 'RsrStream',
	#instVars : [
		'socket'
	],
	#category : 'RemoteServiceReplication-Factory-GemStone'
}

{ #category : 'testing' }
RsrGsSocketStream >> atEnd [
	"Return whether additional bytes could become available on the socket."

	^socket isConnected not
]

{ #category : 'accessing' }
RsrGsSocketStream >> chunkSize [
	"The largest size that should be read from or written to a Socket in each attempt."

	^4096
]

{ #category : 'closing' }
RsrGsSocketStream >> close [

	socket close
]

{ #category : 'accessing' }
RsrGsSocketStream >> next [
	"Return the next byte"

	^self next: 1
]

{ #category : 'accessing' }
RsrGsSocketStream >> next: count [
	"Return exactly <count> number of bytes.
	Signal RsrSocketClosed if the socket closes."

	^[| chunkSize bytes position numRead |
	chunkSize := self chunkSize.
	bytes := ByteArray new: count.
	position := 1.
	[position <= count]
		whileTrue:
			[numRead := socket
				read: (chunkSize min: count - position + 1)
				into: bytes
				startingAt: position.
			numRead > 0
				ifFalse:
					[socket close.
					RsrSocketClosed signal].
			position := position + numRead].
	bytes]
		on: SocketError
		do: [:ex | ex resignalAs: (RsrSocketClosed new messageText: ex messageText)].
]

{ #category : 'adding' }
RsrGsSocketStream >> nextPutAll: bytes [
	"Write <bytes> to the socket."

	| chunkSize position numBytes numWritten |
	chunkSize := self chunkSize.
	position := 1.
	numBytes := bytes size.
	[position <= numBytes]
		whileTrue:
			[numWritten := [socket
				write: (chunkSize min: numBytes - position + 1)
				from: bytes
				startingAt: position]
					on: SocketError
					do: [:ex | ex resignalAs: (RsrSocketClosed new messageText: ex messageText)].
			position := position + numWritten]
]

{ #category : 'accessing' }
RsrGsSocketStream >> socket: anRsrSocket [

	socket := anRsrSocket
]
