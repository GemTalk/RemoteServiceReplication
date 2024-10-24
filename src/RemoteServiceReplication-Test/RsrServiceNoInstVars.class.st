Class {
	#name : 'RsrServiceNoInstVars',
	#superclass : 'RsrService',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrServiceNoInstVars class >> clientClassName [

	^#RsrClientNoInstVars
]

{ #category : 'accessing' }
RsrServiceNoInstVars class >> serverClassName [

	^#RsrServerNoInstVars
]

{ #category : 'accessing' }
RsrServiceNoInstVars class >> templateClassName [

	^#RsrServiceNoInstVars
]

{ #category : 'testing-methods' }
RsrServiceNoInstVars >> asyncSendReturnArgument: anObject [

	^remoteSelf returnArgument: anObject
]

{ #category : 'accessing' }
RsrServiceNoInstVars >> returnArgument: anObject [

	^anObject
]

{ #category : 'testing-methods' }
RsrServiceNoInstVars >> sendReturnArgument: anObject [

	^(remoteSelf returnArgument: anObject) wait
]
