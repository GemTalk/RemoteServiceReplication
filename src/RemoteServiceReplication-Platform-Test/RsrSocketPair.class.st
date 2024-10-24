Class {
	#name : 'RsrSocketPair',
	#superclass : 'RsrObject',
	#instVars : [
		'firstSocket',
		'secondSocket'
	],
	#category : 'RemoteServiceReplication-Platform-Test',
	#package : 'RemoteServiceReplication-Platform-Test'
}

{ #category : 'instance creation' }
RsrSocketPair class >> firstSocket: firstSocket
secondSocket: secondSocket [

	^super new
		firstSocket: firstSocket;
		secondSocket: secondSocket;
		yourself
]

{ #category : 'accessing' }
RsrSocketPair class >> listenPort [

	^64455
]

{ #category : 'instance creation' }
RsrSocketPair class >> new [

	| localhost port listener firstSocket secondSocket |
	localhost := '127.0.0.1'.
	port := 8765.
	listener := self socketClass new.
	secondSocket := self socketClass new.
	listener
		bindAddress: localhost
		port: port.
	listener listen: 1.
	secondSocket
		connectToHost: localhost
		port: port.
	firstSocket := listener accept.
	listener close.
	(firstSocket isConnected and: [secondSocket isConnected])
		ifFalse: [self error: 'Failed to create socket pair'].
	^self
		firstSocket: firstSocket
		secondSocket: secondSocket
]

{ #category : 'accessing' }
RsrSocketPair class >> socketClass [

	^RsrSocket
]

{ #category : 'closing' }
RsrSocketPair >> close [

	firstSocket close.
	secondSocket close
]

{ #category : 'accessing' }
RsrSocketPair >> firstSocket [

	^firstSocket
]

{ #category : 'accessing' }
RsrSocketPair >> firstSocket: anObject [

	firstSocket := anObject
]

{ #category : 'accessing' }
RsrSocketPair >> firstStream [

	^self socketStreamClass on: firstSocket
]

{ #category : 'accessing' }
RsrSocketPair >> secondSocket [

	^secondSocket
]

{ #category : 'accessing' }
RsrSocketPair >> secondSocket: anObject [

	secondSocket := anObject
]

{ #category : 'accessing' }
RsrSocketPair >> secondStream [

	^self socketStreamClass on: secondSocket
]

{ #category : 'accessing' }
RsrSocketPair >> socketStreamClass [

	^(RsrClassResolver classNamed: #RsrSocketStream)
]
