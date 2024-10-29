Class {
	#name : 'RsrLogDestination',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'writing' }
RsrLogDestination >> write: aMessage [

	self subclassResponsibility
]
