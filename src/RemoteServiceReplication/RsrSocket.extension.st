Extension { #name : 'RsrSocket' }

{ #category : '*RemoteServiceReplication' }
RsrSocket >> bufferedSocketStream [
	"Return a SocketStream on the receiver"
	
	^RsrBufferedStream on: self socketStream
]

{ #category : '*RemoteServiceReplication' }
RsrSocket >> socketStream [
	"Return a SocketStream on the receiver"
	
	^RsrSocketStream on: self
]
