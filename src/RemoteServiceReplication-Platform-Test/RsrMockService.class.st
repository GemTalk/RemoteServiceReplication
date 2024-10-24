Class {
	#name : 'RsrMockService',
	#superclass : 'RsrService',
	#category : 'RemoteServiceReplication-Platform-Test',
	#package : 'RemoteServiceReplication-Platform-Test'
}

{ #category : 'accessing' }
RsrMockService class >> clientClassName [

	^#RsrMockClient
]

{ #category : 'accessing' }
RsrMockService class >> serverClassName [

	^#RsrMockServer
]

{ #category : 'initialize' }
RsrMockService >> initialize [

	super initialize.
	_id := 1
]

{ #category : 'testing' }
RsrMockService >> isClient [

	^self class == RsrMockClient
]

{ #category : 'testing' }
RsrMockService >> isServer [

	^self class == RsrMockServer
]

{ #category : 'accessing' }
RsrMockService >> service [

	^self
]
