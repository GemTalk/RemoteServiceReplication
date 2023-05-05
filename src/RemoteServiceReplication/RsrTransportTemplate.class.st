"
I'm abstract. My subclasses define rather stupid data-holder objects that specify how to build one or two instance of a concrete subclass of RsrTransport.

To use a template, 
	RsrTransport buildFrom: aTemplate.
or
	RsrTransport openFrom: aTemplate.
or
	RsrTransport openSessionFrom: aTemplate.

What is answered differs among my subclasses; see their class comments for details.

"
Class {
	#name : 'RsrTransportTemplate',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication'
}
