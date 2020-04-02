Class {
	#name : #RsrDispatchEventLoop,
	#superclass : #RsrEventLoop,
	#instVars : [
		'queue'
	],
	#category : #'RemoteServiceReplication-Communications'
}

{ #category : #dispatching }
RsrDispatchEventLoop >> dispatch: aCommand [

	self report: aCommand.
	queue nextPut: aCommand
]

{ #category : #running }
RsrDispatchEventLoop >> executeCycle [

	| item |
	item := queue next.
	item == self stopToken
		ifFalse: [item executeFor: connection]
]

{ #category : #initialize }
RsrDispatchEventLoop >> initialize [

	super initialize.
	queue := SharedQueue new
]

{ #category : #accessing }
RsrDispatchEventLoop >> priority [

	^super priority - 1
]

{ #category : #commands }
RsrDispatchEventLoop >> stop [

	super stop.
	queue nextPut: self stopToken
]

{ #category : #accessing }
RsrDispatchEventLoop >> stopToken [

	^self stoppedState
]