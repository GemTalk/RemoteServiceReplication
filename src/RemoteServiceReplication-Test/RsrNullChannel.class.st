"
A not-very-functional channel used only for limited testing of things that require a session, but not to actually transfer any information between session peers.
"
Class {
	#name : 'RsrNullChannel',
	#superclass : 'RsrChannel',
	#instVars : [
		'lastCommand'
	],
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrNullChannel >> addCommunicationProcessesTo: aSet [
	"NOP"
]

{ #category : 'lifecycle' }
RsrNullChannel >> close [

	"NOP"
]

{ #category : 'testing' }
RsrNullChannel >> isConnected [

	^true
]

{ #category : 'accessing' }
RsrNullChannel >> lastCommand [

	^lastCommand
]

{ #category : 'lifecycle' }
RsrNullChannel >> open [

	"NOP"
]

{ #category : 'events' }
RsrNullChannel >> received: aCommand [

	lastCommand := aCommand
]

{ #category : 'events' }
RsrNullChannel >> send: aCommand [

	lastCommand := aCommand
]
