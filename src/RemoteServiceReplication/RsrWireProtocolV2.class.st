Class {
	#name : 'RsrWireProtocolV2',
	#superclass : 'RsrWireProtocol',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrWireProtocolV2 >> decoder [
	"Returns the decoder to use for this wire protocol version."
	
	^RsrProtocolDecoderV2 new
]

{ #category : 'accessing' }
RsrWireProtocolV2 >> encoder [
	"Returns the encoder to use for this wire protocol version."
	
	^RsrProtocolEncoderV2 new
]

{ #category : 'accessing' }
RsrWireProtocolV2 >> version [
	"Returns the wire protocol version number."
	
	^2
]
