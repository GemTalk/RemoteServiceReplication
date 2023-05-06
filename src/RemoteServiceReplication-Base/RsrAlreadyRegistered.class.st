Class {
	#name : 'RsrAlreadyRegistered',
	#superclass : 'RsrError',
	#instVars : [
		'service',
		'intendedRsrSession'
	],
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrAlreadyRegistered class >> signalService: aService
intendedRsrSession: anRsrSession [

	^self new
		service: aService;
		intendedRsrSession: anRsrSession;
		signal
]

{ #category : 'accessing' }
RsrAlreadyRegistered >> intendedRsrSession [

	^intendedRsrSession
]

{ #category : 'accessing' }
RsrAlreadyRegistered >> intendedRsrSession: aConnection [

	intendedRsrSession := aConnection
]

{ #category : 'accessing' }
RsrAlreadyRegistered >> service [

	^service
]

{ #category : 'accessing' }
RsrAlreadyRegistered >> service: aService [

	service := aService
]
