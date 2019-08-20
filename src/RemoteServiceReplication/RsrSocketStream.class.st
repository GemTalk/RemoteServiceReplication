Class {
	#name : #RsrSocketStream,
	#superclass : #RsrObject,
	#instVars : [
		'socket'
	],
	#category : #'RemoteServiceReplication-Utilities'
}

{ #category : #'instance creation' }
RsrSocketStream class >> on: anRsrSocket [

	^self new
		socket: anRsrSocket;
		yourself
]

{ #category : #testing }
RsrSocketStream >> atEnd [

	^self isConnected
]

{ #category : #lifecycle }
RsrSocketStream >> close [

	socket close
]

{ #category : #writing }
RsrSocketStream >> flush [

	"NOP"
]

{ #category : #testing }
RsrSocketStream >> isConnected [

	^socket isConnected
]

{ #category : #reading }
RsrSocketStream >> next [

	^self next: 1
]

{ #category : #reading }
RsrSocketStream >> next: aCount [

	^[socket read: aCount]
		on: RsrConnectionClosed
		do: [:ex | ex return: nil]
]

{ #category : #writing }
RsrSocketStream >> nextPutAll: bytes [

	socket write: bytes
]

{ #category : #accessing }
RsrSocketStream >> socket: anRsrSocket [

	socket := anRsrSocket
]