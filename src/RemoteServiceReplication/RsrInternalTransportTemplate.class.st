"
I'm a Template for RsrTransports where both ends of the transport are in the same Smalltalk VM. I specify creating both ends of the transport at once.

To use a template, 
	RsrTransport buildFrom: aTemplate.
or
	RsrTransport openFrom: aTemplate.
or
	RsrTransport openSessionFrom: aTemplate.
	
#buildFrom: will answer an Array of two RsrTransports, initialized but not necessarily open.

#openFrom: will send #buildFrom: then open the transports and answer them in an open state. #openFrom will not answer (will block) until the transports are in an open state.

#openSessionFrom: will send openFrom: then create, open, and answer a pair of RsrSessions.
"
Class {
	#name : 'RsrInternalTransportTemplate',
	#superclass : 'RsrTransportTemplate',
	#category : 'RemoteServiceReplication'
}
