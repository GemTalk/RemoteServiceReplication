Class {
	#name : #RsrSocketTestCase,
	#superclass : #RsrTestCase,
	#category : #'RemoteServiceReplication-Compatibility-Test'
}

{ #category : #running }
RsrSocketTestCase >> assertWriting: bytes
to: writingSocket
isReadableOn: readSocket [

	| readBytes |
	writingSocket write: bytes.
	readBytes := readSocket read: bytes size.
	self
		assert: readBytes
		equals: bytes
]

{ #category : #accessing }
RsrSocketTestCase >> randomPort [

	^50123
]

{ #category : #running }
RsrSocketTestCase >> testConnectLocalSockets [

	| listener server client port |
	listener := RsrSocket new.
	client := RsrSocket new.
	port := self randomPort.
	listener listenOn: port.
	client connectTo: port on: '127.0.0.1'.
	server := listener accept.
	listener close.
	self
		assert: server isConnected;
		assert: client isConnected.
	self
		assertWriting: #(1 2 3 4 5 6 7 8 9 0) asByteArray
		to: server
		isReadableOn: client.
	self
		assertWriting: #(0 9 8 7 6 5 4 3 2 1) asByteArray
		to: client
		isReadableOn: server
]

{ #category : #running }
RsrSocketTestCase >> testConnectToClosedPort [

	| socket |
	socket := RsrSocket new.
	self
		should: [socket connectTo: 64752 on: '127.0.0.1']
		raise: Error
]