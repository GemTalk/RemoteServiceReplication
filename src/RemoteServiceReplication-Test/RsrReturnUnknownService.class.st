Class {
	#name : 'RsrReturnUnknownService',
	#superclass : 'RsrService',
	#instVars : [
		'sharedVariable'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrReturnUnknownService class >> clientClassName [

	^#RsrDoNotCreateThisClass
]

{ #category : 'accessing' }
RsrReturnUnknownService class >> serverClassName [

	^#RsrKnownServer
]

{ #category : 'accessing' }
RsrReturnUnknownService class >> templateClassName [

	^#RsrReturnUnknownService
]
