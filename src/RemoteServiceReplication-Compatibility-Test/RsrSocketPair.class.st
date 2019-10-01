Class {
	#name : #RsrSocketPair,
	#superclass : #RsrObject,
	#instVars : [
		'firstSocket',
		'secondSocket'
	],
	#category : #'RemoteServiceReplication-Compatibility-Test-Utilities'
}

{ #category : #'instance creation' }
RsrSocketPair class >> firstSocket: firstSocket
secondSocket: secondSocket [

	^super new
		firstSocket: firstSocket;
		secondSocket: secondSocket;
		yourself
]

{ #category : #accessing }
RsrSocketPair class >> listenPort [

	^64455
]

{ #category : #'instance creation' }
RsrSocketPair class >> new [

	| listener firstSocket secondSocket |
	listener := RsrSocket new.
	secondSocket := RsrSocket new.
	listener listenOn: self listenPort.
	secondSocket
		connectTo: self listenPort
		on: '127.0.0.1'.
	firstSocket := listener accept.
	listener close.
	(firstSocket isConnected and: [secondSocket isConnected])
		ifFalse: [self error: 'Failed to create socket pair'].
	^self
		firstSocket: firstSocket
		secondSocket: secondSocket
]

{ #category : #accessing }
RsrSocketPair class >> timeout [

	^2
]

{ #category : #accessing }
RsrSocketPair >> close [

	firstSocket close.
	secondSocket close
]

{ #category : #accessing }
RsrSocketPair >> firstSocket [
	^ firstSocket
]

{ #category : #accessing }
RsrSocketPair >> firstSocket: anObject [
	firstSocket := anObject
]

{ #category : #accessing }
RsrSocketPair >> firstStream [

	^(RsrClassResolver classNamed: #RsrSocketStream) on: firstSocket
]

{ #category : #accessing }
RsrSocketPair >> secondSocket [
	^ secondSocket
]

{ #category : #accessing }
RsrSocketPair >> secondSocket: anObject [
	secondSocket := anObject
]

{ #category : #accessing }
RsrSocketPair >> secondStream [

	^(RsrClassResolver classNamed: #RsrSocketStream) on: secondSocket
]