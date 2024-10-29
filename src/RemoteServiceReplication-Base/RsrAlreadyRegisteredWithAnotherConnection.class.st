Class {
	#name : 'RsrAlreadyRegisteredWithAnotherConnection',
	#superclass : 'RsrError',
	#instVars : [
		'service',
		'intendedConnection'
	],
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrAlreadyRegisteredWithAnotherConnection class >> signalService: aService
intendedConnection: aConnection [

	^self new
		service: aService;
		intendedConnection: aConnection;
		signal
]

{ #category : 'accessing' }
RsrAlreadyRegisteredWithAnotherConnection >> intendedConnection [

	^intendedConnection
]

{ #category : 'accessing' }
RsrAlreadyRegisteredWithAnotherConnection >> intendedConnection: aConnection [

	intendedConnection := aConnection
]

{ #category : 'accessing' }
RsrAlreadyRegisteredWithAnotherConnection >> service [

	^service
]

{ #category : 'accessing' }
RsrAlreadyRegisteredWithAnotherConnection >> service: aService [

	service := aService
]
