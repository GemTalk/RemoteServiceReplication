Class {
	#name : 'RsrServiceReaper',
	#superclass : 'RsrObject',
	#instVars : [
		'weakStorage'
	],
	#category : 'RemoteServiceReplication-Pharo-12',
	#package : 'RemoteServiceReplication-Pharo-12'
}

{ #category : 'instance creation' }
RsrServiceReaper class >> for: aRegistry [

	^self new
		registry: aRegistry;
		yourself
]

{ #category : 'instance creation' }
RsrServiceReaper >> initialize [

	super initialize.
	weakStorage := WeakArray new: 1
]

{ #category : 'reaping' }
RsrServiceReaper >> reapClient: aKey [

	self registry ifNotNil: [:registry | registry reapClient: aKey]
]

{ #category : 'reaping' }
RsrServiceReaper >> reapServer: aKey [

	self registry ifNotNil: [:registry | registry reapServer: aKey]
]

{ #category : 'accessing' }
RsrServiceReaper >> registry [

	^weakStorage at: 1
]

{ #category : 'accessing' }
RsrServiceReaper >> registry: aRegistry [

	weakStorage
		at: 1
		put: aRegistry
]
