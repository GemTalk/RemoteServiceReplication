"
A not-very-functional channel used only for limited testing of things that require a session, but not to actually transfer any information between session peers.
"
Class {
	#name : 'RsrNullChannel',
	#superclass : 'RsrObsoleteChannel',
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

{ #category : 'accessing' }
RsrNullChannel >> idInterval [

	"Answer an Interval that defines acceptable unique IDs for my Session.
	All elements must be integers, and must be distinct from the interval 
	used by the other ends of this Channel."

	^ self class positiveIdRange
]

{ #category : 'testing' }
RsrNullChannel >> isConnected [

	^true
]

{ #category : 'testing' }
RsrNullChannel >> isOpen [

	"At NullChannel, we never close"

	^ true
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
