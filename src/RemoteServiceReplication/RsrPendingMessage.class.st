Class {
	#name : 'RsrPendingMessage',
	#superclass : 'RsrObject',
	#instVars : [
		'services',
		'promise'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrPendingMessage class >> services: aList
promise: aPromise [

	^self new
		services: aList;
		promise: aPromise;
		yourself
]

{ #category : 'accessing' }
RsrPendingMessage >> promise [

	^promise
]

{ #category : 'accessing' }
RsrPendingMessage >> promise: aPromise [

	promise := aPromise
]

{ #category : 'accessing' }
RsrPendingMessage >> services [

	^services
]

{ #category : 'accessing' }
RsrPendingMessage >> services: aList [

	services := aList
]
