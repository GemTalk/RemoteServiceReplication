"
I am abstract. Each RsrChannel uses a Transport to send and receive bytes or objects (depending on the type of Channel). Each Transport is responsible for the delivery of those bytes or objects to its peer Transport.
"
Class {
	#name : 'RsrTransport',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrTransport class >> buildFrom: aTransportTemplate [

	"Use the given template to create a transport.
	Answer a not-necessarily-open transport."

	aTransportTemplate buildsSingleTransport ifFalse: [ 
		^ self error:
			  '#buildFrom: is inappropriate for this template, which builds more than one transport' ].
	^ aTransportTemplate transportClass buildFrom: aTransportTemplate
]

{ #category : 'instance creation' }
RsrTransport class >> buildPairFrom: aTransportTemplate [

	"Use the given template to create a pair of transports.
	Answer an array of two tranports, not necessarily open."

	aTransportTemplate buildsTransportPair ifFalse: [ 
		^ self error:
			  '#buildPairFrom: is inappropriate for this template, which does not build a pair of transports.' ].
	^ aTransportTemplate transportClass buildPairFrom: aTransportTemplate
]

{ #category : 'instance creation' }
RsrTransport class >> openFrom: aTransportTemplate [

	"Use the given template to create a transport, and open it.
	Answer an open ready-to-use transport."

	| transport |
	transport := self buildFrom: aTransportTemplate.
	^ transport open
]

{ #category : 'instance creation' }
RsrTransport class >> openPairFrom: aTransportTemplate [

	"Use the given template to create a transport pair, and open them.
	Answer an array of two open, ready-to-use, transports."

	| transports semaphores |
	transports := self buildPairFrom: aTransportTemplate.
	semaphores := (1 to: 2) collect: [ :x | Semaphore new ].
	
	"The transports talk to each other. For some transport types 
	(e.g. TCP sockets) neither open can succeed until the other
	is attempted, so do them in separate threads and wait for
	both to succeed."
	transports with: semaphores do: [ :xport :sem | 
		[ 
		xport open.
		sem signal ] fork ].
	semaphores do: [ :sem | sem wait ].
	^ transports
]

{ #category : 'instance creation' }
RsrTransport class >> openRsrSessionFrom: aTransportTemplate [

	"Use the given template to create a transport, and open a channel and session that will use that transport. Answer the session."

	| transport |
	transport := self openFrom: aTransportTemplate.
	^ transport openRsrSession
]

{ #category : 'instance creation' }
RsrTransport class >> openRsrSessionPairFrom: aTransportTemplate [

	"Use the given template to create a transport, and open a channel and session that will use that transport. Answer the session."

	| transports |
	transports := self openPairFrom: aTransportTemplate.
	^ transports collect: [ :each | each openRsrSession ].
]
