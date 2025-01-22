Class {
	#name : 'RsrWireProtocol',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrWireProtocol >> decoder [
	"Returns the decoder to use for this wire protocol version."
	
	self subclassResponsibility
]

{ #category : 'accessing' }
RsrWireProtocol >> encoder [
	"Returns the encoder to use for this wire protocol version."
	
	self subclassResponsibility
]

{ #category : 'accessing' }
RsrWireProtocol >> version [
	"Returns the wire protocol version number."
	
	self subclassResponsibility
]
