Class {
	#name : 'RsrSendUnknownService',
	#superclass : 'RsrService',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrSendUnknownService class >> clientClassName [

	^#RsrKnownClient
]

{ #category : 'accessing' }
RsrSendUnknownService class >> serverClassName [

	^#RsrDoNotCreateThisClass
]

{ #category : 'accessing' }
RsrSendUnknownService class >> templateClassName [

	^#RsrSendUnknownService
]
