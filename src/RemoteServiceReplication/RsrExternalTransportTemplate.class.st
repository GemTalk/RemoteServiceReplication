"
I'm a Template for RsrTransports where one end of the transport is in this Smalltalk VM, and the other end of the transport will be in some other Smalltalk VM.

To use a template, 
	RsrTransport buildFrom: aTemplate.
or
	RsrTransport openFrom: aTemplate.
or
	RsrTransport openRsrSessionFrom: aTemplate.
	
#buildFrom: will answer a newly-created RsrTransport, initialized but not necessarily open.

#openFrom: will send #buildFrom: then open the transport and answer it in an open state. #openFrom will not answer (will block) until the transport is in an open state.

#openRsrSessionFrom: will send openFrom: then create, open, and answer an open RsrSession.
"
Class {
	#name : 'RsrExternalTransportTemplate',
	#superclass : 'RsrTransportTemplate',
	#category : 'RemoteServiceReplication'
}

{ #category : 'testing' }
RsrExternalTransportTemplate >> buildsSingleTransport [

	"Answer true if I specify one transport."

	^ true
]
