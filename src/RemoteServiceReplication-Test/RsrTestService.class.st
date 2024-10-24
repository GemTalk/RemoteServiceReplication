Class {
	#name : 'RsrTestService',
	#superclass : 'RsrService',
	#instVars : [
		'sharedVariable'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrTestService class >> clientClassName [

	^#RsrClientTestService
]

{ #category : 'accessing' }
RsrTestService class >> serverClassName [

	^#RsrServerTestService
]

{ #category : 'accessing' }
RsrTestService class >> templateClassName [

	^#RsrTestService
]

{ #category : 'accessing' }
RsrTestService >> remoteSelf [

	^remoteSelf
]

{ #category : 'accessing' }
RsrTestService >> sharedVariable [

	^sharedVariable
]

{ #category : 'accessing' }
RsrTestService >> sharedVariable: anObject [

	sharedVariable := anObject
]
