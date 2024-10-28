Class {
	#name : 'RsrObject',
	#superclass : 'Object',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'tracing' }
RsrObject class >> trace [

	Transcript
		show: RsrProcessModel currentStackDump;
		cr;
		cr
]
