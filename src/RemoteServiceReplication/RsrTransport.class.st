"
I am abstract. Each RsrChannel uses a Transport to send and receive bytes or objects (depending on the type of Channel). Each Transport is responsible for the delivery of those bytes or objects to its peer Transport.
"
Class {
	#name : 'RsrTransport',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication'
}
