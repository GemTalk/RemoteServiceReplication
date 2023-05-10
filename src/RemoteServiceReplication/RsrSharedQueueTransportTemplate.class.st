"
I am a template for transports that move objects as objects through the local object memory of the Smalltalk VM. I do not need to be configured, just create an instance with #new.
"
Class {
	#name : 'RsrSharedQueueTransportTemplate',
	#superclass : 'RsrInternalTransportTemplate',
	#category : 'RemoteServiceReplication'
}

{ #category : 'as yet unclassified' }
RsrSharedQueueTransportTemplate >> transportClass [

	"Answer the class of Transport that I describe; a concrete subclass of RsrTransport."

	^ RsrSharedQueueTransport
]
