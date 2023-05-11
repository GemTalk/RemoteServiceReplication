Class {
	#name : 'RsrSharedQueueTransportDescription',
	#superclass : 'RsrTransportDescription',
	#category : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrSharedQueueTransportDescription >> type [

	"Answer a Symbol indicating the type of transport this is. 
	All TransportDescriptions must respond to this message.
	Depending on the type, other messages may also be understood."

	^ #SharedQueue
]
