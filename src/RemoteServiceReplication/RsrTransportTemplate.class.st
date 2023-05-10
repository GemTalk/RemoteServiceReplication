"
I'm abstract. My subclasses define rather stupid data-holder objects that specify how to build one or two instance of a concrete subclass of RsrTransport.

"
Class {
	#name : 'RsrTransportTemplate',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication'
}

{ #category : 'testing' }
RsrTransportTemplate >> buildsSingleTransport [

	"Answer true if I specify one transport."

	^ false
]

{ #category : 'testing' }
RsrTransportTemplate >> buildsTransportPair [

	"Answer true if I specify a pair of internal transports."

	^ false
]

{ #category : 'accessing' }
RsrTransportTemplate >> transportClass [

	"Answer the class of Transport that I describe; a concrete subclass of RsrTransport."

	^ self subclassResponsibility
]
