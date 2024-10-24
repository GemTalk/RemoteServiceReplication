Class {
	#name : 'RsrReflectedVariableTestServiceB',
	#superclass : 'RsrReflectedVariableTestServiceA',
	#instVars : [
		'varB'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrReflectedVariableTestServiceB class >> clientClassName [

	^#RsrReflectedVariableTestClient
]

{ #category : 'accessing' }
RsrReflectedVariableTestServiceB class >> serverClassName [

	^#RsrReflectedVariableTestServer
]

{ #category : 'accessing' }
RsrReflectedVariableTestServiceB class >> templateClassName [

	^#RsrReflectedVariableTestServiceB
]

{ #category : 'accessing' }
RsrReflectedVariableTestServiceB >> varB [

	^varB
]
