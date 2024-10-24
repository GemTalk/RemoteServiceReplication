Class {
	#name : 'RsrServiceReferenceService',
	#superclass : 'RsrService',
	#instVars : [
		'service'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrServiceReferenceService class >> clientClassName [

	^#RsrClientReferenceService
]

{ #category : 'accessing' }
RsrServiceReferenceService class >> serverClassName [

	^#RsrServerReferenceService
]

{ #category : 'instance creation' }
RsrServiceReferenceService class >> service: aService [

	^self new
		service: aService;
		yourself
]

{ #category : 'accessing' }
RsrServiceReferenceService class >> templateClassName [

	^#RsrServiceReferenceService
]

{ #category : 'accessing' }
RsrServiceReferenceService >> service [
	^ service
]

{ #category : 'accessing' }
RsrServiceReferenceService >> service: anObject [
	service := anObject
]
