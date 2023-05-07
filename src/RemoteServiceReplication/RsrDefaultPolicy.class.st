Class {
	#name : 'RsrDefaultPolicy',
	#superclass : 'RsrAbstractPolicy',
	#category : 'RemoteServiceReplication'
}

{ #category : 'testing' }
RsrDefaultPolicy >> permits: aTemplate [
	"Returning true to allow the framework to instantiate 
	a Service received over the Session's channel."

	^true
]
