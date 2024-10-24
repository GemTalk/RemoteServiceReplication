Class {
	#name : 'RsrConcurrentTestService',
	#superclass : 'RsrService',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrConcurrentTestService class >> clientClassName [

	^#RsrConcurrentTestClient
]

{ #category : 'accessing' }
RsrConcurrentTestService class >> serverClassName [

	^#RsrConcurrentTestServer
]

{ #category : 'accessing' }
RsrConcurrentTestService class >> templateClassName [

	^#RsrConcurrentTestService
]
