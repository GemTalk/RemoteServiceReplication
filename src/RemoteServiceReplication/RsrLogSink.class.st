Class {
	#name : 'RsrLogSink',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'writing' }
RsrLogSink >> write: aMessage [

	self subclassResponsibility
]
