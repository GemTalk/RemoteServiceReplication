Class {
	#name : 'RsrRegistryEntry',
	#superclass : 'RsrObject',
	#instVars : [
		'service',
		'dispatcher'
	],
	#category : 'RemoteServiceReplication-Compatibility-GemStone'
}

{ #category : 'instance-creation' }
RsrRegistryEntry class >> with: anObject [

	^self new
        value: anObject;
        yourself
]

{ #category : 'accessing' }
RsrRegistryEntry >> dispatcher [

	^dispatcher
]

{ #category : 'accessing' }
RsrRegistryEntry >> dispatcher: aMessageDispatcher [

	dispatcher := aMessageDispatcher
]

{ #category : 'accessing' }
RsrRegistryEntry >> service [

	^service
]

{ #category : 'accessing' }
RsrRegistryEntry >> service: anRsrService [

	service := anRsrService
]

{ #category : 'accessing' }
RsrRegistryEntry >> value [

	^self service
]

{ #category : 'accessing' }
RsrRegistryEntry >> value: anObject [

	self service: anObject
]