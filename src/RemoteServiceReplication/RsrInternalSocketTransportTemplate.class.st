"
I am a template for transports that move objects as bytes through a TCP socket, both ends of which are in the same Smalltalk image. I am not configurable, I always use the localhost address and the port defined in the #defaultPort method.
"
Class {
	#name : 'RsrInternalSocketTransportTemplate',
	#superclass : 'RsrInternalTransportTemplate',
	#category : 'RemoteServiceReplication'
}
