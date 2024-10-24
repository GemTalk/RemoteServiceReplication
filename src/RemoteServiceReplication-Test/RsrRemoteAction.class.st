Class {
	#name : 'RsrRemoteAction',
	#superclass : 'RsrService',
	#instVars : [
		'sharedVariable'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'instance creation' }
RsrRemoteAction class >> sharedVariable: anObject [

	^self new
		sharedVariable: anObject;
		yourself
]

{ #category : 'accessing' }
RsrRemoteAction class >> templateClassName [

	^#RsrRemoteAction
]

{ #category : 'accessing' }
RsrRemoteAction >> sharedVariable [

	^sharedVariable
]

{ #category : 'accessing' }
RsrRemoteAction >> sharedVariable: anObject [

	sharedVariable := anObject
]
