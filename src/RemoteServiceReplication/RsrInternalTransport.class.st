"
I am abstract. My subclasses are transports that provide byte or object streams from and to a counterpart that is in this Smalltalk VM.

Since both ends are local objects, internal transports are created in pairs that know how to talk to each other.
"
Class {
	#name : 'RsrInternalTransport',
	#superclass : 'RsrTransport',
	#category : 'RemoteServiceReplication'
}
