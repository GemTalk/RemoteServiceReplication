"
Does load-time initialization of any class instance variables of classes defined in Base but that have platform-specific contents and thus can't be initialized by their own package, and can't be lazily initialized because that fails on GemStone for non-privileged users.
"
Class {
	#name : 'RsrPlatformInitializer',
	#superclass : 'Object',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'class initialization' }
RsrPlatformInitializer class >> initialize [

	RsrReference initializeReferenceMapping
]
