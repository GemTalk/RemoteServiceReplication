"
I am abstract.
My concrete subclasses offer descriptions of RsrTransports, which can be used by the 
users of RsrSessions. 

All TransportDescriptions must answer a Symbol when sent #type.
Other acceptable messages depend on the type.

Note that a TransportTemplate gives the information necessary to *create* a Transport,
while the TransportDescription may give additional information about an open Transport.
For instance, a Template for a TLS Transport might describe the acceptable TLS version and
cipher suite, and after the TLS connection is made the Description would give the TLS version
and cipher suite actually negotiated.
"
Class {
	#name : 'RsrTransportDescription',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrTransportDescription >> type [

	"Answer a Symbol indicating the type of transport this is. 
	All TransportDescriptions must respond to this message.
	Depending on the type, other messages may also be understood."

	^ self subclassResponsibility
]
