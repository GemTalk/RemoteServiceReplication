Class {
	#name : 'RsrAlreadyRegistered',
	#superclass : 'RsrError',
	#instVars : [
		'service',
		'intendedConnection'
	],
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrAlreadyRegistered class >> signalService: aService
intendedConnection: aConnection [

	^self new
		service: aService;
		intendedConnection: aConnection;
		signal
]

{ #category : 'accessing' }
RsrAlreadyRegistered >> intendedConnection [

	^intendedConnection
]

{ #category : 'accessing' }
RsrAlreadyRegistered >> intendedConnection: aConnection [

	intendedConnection := aConnection
]

{ #category : 'accessing' }
RsrAlreadyRegistered >> service [

	^service
]

{ #category : 'accessing' }
RsrAlreadyRegistered >> service: aService [

	service := aService
]
