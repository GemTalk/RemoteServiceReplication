"
I'm a Template for RsrTransports where both ends of the transport are in the same Smalltalk VM. I specify creating both ends of the transport at once.

To use a template, 
	RsrTransport buildPairFrom: aTemplate.
or
	RsrTransport openPairFrom: aTemplate.
or
	RsrTransport openRsrSessionPairFrom: aTemplate.
	
#buildPairFrom: will answer an Array of two RsrTransports, initialized but not necessarily open.

#openPairFrom: will send #buildPairFrom: then open the transports and answer them in an open state. #openPairFrom will not answer (will block) until the transports are in an open state.

#openRsrSessionPairFrom: will send openPairFrom: then create, open, and answer a pair of RsrSessions.
"
Class {
	#name : 'RsrInternalTransportTemplate',
	#superclass : 'RsrTransportTemplate',
	#category : 'RemoteServiceReplication'
}

{ #category : 'testing' }
RsrInternalTransportTemplate >> buildsTransportPair [

	"Answer true if I specify a pair of internal transports."

	^ true
]
