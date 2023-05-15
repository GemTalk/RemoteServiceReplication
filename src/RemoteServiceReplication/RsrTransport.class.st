"
I am abstract. Each RsrChannel uses a Transport to send and receive bytes or objects (depending on the type of Channel). Each Transport is responsible for the delivery of those bytes or objects to its peer Transport.

A Transport provides to a Channel a pair of streams (readStream and writeStream) and a description object which the Channel can use to determine the type and configuration of the Transport it is using.
"
Class {
	#name : 'RsrTransport',
	#superclass : 'RsrObject',
	#instVars : [
		'readStream',
		'writeStream',
		'description',
		'template'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'OBSOLETE' }
RsrTransport class >> buildFrom: aTransportTemplate [

	"Use the given template to create a transport.
	Answer a not-necessarily-open transport."

	aTransportTemplate buildsSingleTransport ifFalse: [ 
		^ self error:
			  '#buildFrom: is inappropriate for this template, which builds more than one transport' ].
	^ aTransportTemplate transportClass buildFrom: aTransportTemplate
]

{ #category : 'OBSOLETE' }
RsrTransport class >> buildPairFrom: aTransportTemplate [

	"Use the given template to create a pair of transports.
	Answer an array of two tranports, not necessarily open."

	aTransportTemplate buildsTransportPair ifFalse: [ 
		^ self error:
			  '#buildPairFrom: is inappropriate for this template, which does not build a pair of transports.' ].
	^ aTransportTemplate transportClass buildPairFrom: aTransportTemplate
]

{ #category : 'OBSOLETE' }
RsrTransport class >> openFrom: aTransportTemplate [

	"Use the given template to create a transport, and open it.
	Answer an open ready-to-use transport."

	| transport |
	transport := self buildFrom: aTransportTemplate.
	^ transport open
]

{ #category : 'OBSOLETE' }
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
		RsrProcessModel
			fork: [ 
				xport open.
				sem signal ]
			named: 'TransportPairOpen' ].
	semaphores do: [ :sem | sem wait ].
	^ transports
]

{ #category : 'OBSOLETE' }
RsrTransport class >> openRsrSessionFrom: aTransportTemplate [

	"Use the given template to create a transport, and open a channel and session that will use that transport. Answer the session."

	| transport |
	transport := self openFrom: aTransportTemplate.
	^ transport openRsrSession
]

{ #category : 'OBSOLETE' }
RsrTransport class >> openRsrSessionPairFrom: aTransportTemplate [

	"Use the given template to create a transport, and open a channel and session that will use that transport. Answer the session."

	| transports |
	transports := self openPairFrom: aTransportTemplate.
	^ transports collect: [ :each | each openRsrSession ].
]

{ #category : 'instance creation' }
RsrTransport class >> readStream: aReadStream writeStream: aWriteStream [

	^ self new readStream: aReadStream writeStream: aWriteStream
]

{ #category : 'accessing' }
RsrTransport >> description [

	^ description
]

{ #category : 'testing' }
RsrTransport >> isOpen [

	"Answer true if my streams are functional"

	^ self subclassResponsibility
]

{ #category : 'operations' }
RsrTransport >> open [

	"Make myself ready to send and receive over my streams."

	^ self subclassResponsibility
]

{ #category : 'operations' }
RsrTransport >> openRsrSession [

	"Open and answer a Session that uses me as its transport."

	| channel |
	channel := RsrObsoleteChannel openOn: self.
	^ channel openRsrSession
]

{ #category : 'accessing' }
RsrTransport >> readStream [

	^ readStream
]

{ #category : 'accessing' }
RsrTransport >> readStream: aReadStream [

	readStream := aReadStream
]

{ #category : 'initialization' }
RsrTransport >> readStream: aReadStream writeStream: aWriteStream [

	readStream := aReadStream.
	writeStream := aWriteStream.
	^ self
]

{ #category : 'accessing' }
RsrTransport >> template [

	"If I was created from an RsrTransportTemplate, answer it. Otherwise answer nil."

	^ template
]

{ #category : 'accessing' }
RsrTransport >> template: aTransportTemplate [

	template := aTransportTemplate
]

{ #category : 'accessing' }
RsrTransport >> writeStream [

	^ writeStream
]

{ #category : 'accessing' }
RsrTransport >> writeStream: aWriteStream [

	writeStream := aWriteStream
]
