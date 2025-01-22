Class {
	#name : 'RsrWireProtocolV1',
	#superclass : 'RsrWireProtocol',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrWireProtocolV1 >> decoder [
	"Returns the decoder to use for this wire protocol version."
	
	^RsrProtocolDecoderV1 new
]

{ #category : 'accessing' }
RsrWireProtocolV1 >> encoder [
	"Returns the encoder to use for this wire protocol version."
	
	^RsrProtocolEncoderV1 new
]

{ #category : 'accessing' }
RsrWireProtocolV1 >> version [
	"Returns the wire protocol version number."
	
	^1
]
