Class {
	#name : 'RsrRegistryEntry',
	#superclass : 'RsrObject',
	#instVars : [
		'storage',
		'strongReference'
	],
	#category : 'RemoteServiceReplication-Pharo-11'
}

{ #category : 'instance creation' }
RsrRegistryEntry class >> service: aService
onMourn: aBlock [

	aService
		toFinalizeSend: #cull:
		to: aBlock
		with: nil.
	^self new
		service: aService;
		yourself
]

{ #category : 'transitions' }
RsrRegistryEntry >> becomeStrong [

	strongReference := self service
]

{ #category : 'transitions' }
RsrRegistryEntry >> becomeWeak [

	strongReference := nil
]

{ #category : 'initializing' }
RsrRegistryEntry >> initialize [

	super initialize.
	storage := WeakArray new: 1
]

{ #category : 'accessing' }
RsrRegistryEntry >> service [

	^storage at: 1
]

{ #category : 'accessing' }
RsrRegistryEntry >> service: aService [

	storage
		at: 1
		put: aService
]
