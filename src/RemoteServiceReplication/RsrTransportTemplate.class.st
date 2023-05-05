"
I'm a rather stupid data-holder object that specifies how to build one or two instance of a concrete subclass of RsrTransport.

To use a template, 
	RsrTransport buildFrom: aTemplate.
or
	RsrTransport openFrom: aTemplate.
	
#buildFrom: will answer an instance of the appropriate subclass of RsrTransport, initialized but not yet open.

#openFrom: will send #buildFrom: then open the transport and answer it in an open state. #openFrom will not answer (will block) until the transport is in an open state.
"
Class {
	#name : 'RsrTransportTemplate',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication'
}
