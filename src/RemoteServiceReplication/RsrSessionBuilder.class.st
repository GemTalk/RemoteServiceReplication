"
Abstract superclass of classes that can build RsrSessions or RsrSessionPairs and the stack of objects (Session, Channel, Codec, Transport) to make a functional session.

"
Class {
	#name : 'RsrSessionBuilder',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication'
}

{ #category : 'private' }
RsrSessionBuilder >> buildSessionForTransport: anOpenTransport [

	"Build and answer a session based on the open transport."

	| codec channel |
	codec := anOpenTransport createCodec.
	channel := self
		           createChannelForCodec: codec
		           openingSteps: self openingSteps.
	channel open.
	^ channel createSession
]

{ #category : 'private' }
RsrSessionBuilder >> createChannelForCodec: codec openingSteps: openingSteps [

	| channel |
	codec isOpen ifFalse: [ RsrTransportNotOpen signal ].
	channel := RsrChannel forCodec: codec openingSteps: openingSteps.
	channel open.
	^ channel
]

{ #category : 'private' }
RsrSessionBuilder >> openingSteps [

	"Answer an OrderedCollection of opening handshake steps for the Channel 
	of a Session I build.
	Subclasses should override with the superclass steps and append their own steps as appropriate."

	^ RsrChannel defaultOpeningSteps
]
