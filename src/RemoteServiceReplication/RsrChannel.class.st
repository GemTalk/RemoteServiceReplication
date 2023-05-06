"
No class-specific documentation for RsrChannel, hierarchy is:
Object
  RsrObject
    RsrChannel

"
Class {
	#name : 'RsrChannel',
	#superclass : 'RsrObject',
	#instVars : [
		'rsrSession'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrChannel >> addCommunicationProcessesTo: aSet [
	"Add all processes used for Communication to the provided set."
	
	self subclassResponsibility
]

{ #category : 'lifecycle' }
RsrChannel >> close [
	"Ensure the channel is closed to further communication."

	^self subclassResponsibility
]

{ #category : 'events' }
RsrChannel >> genericError: anError [

	^self rsrSession unknownError: anError
]

{ #category : 'testing' }
RsrChannel >> isConnected [
	"Report whether the Channel is open between Connections."

	^self subclassResponsibility
]

{ #category : 'testing' }
RsrChannel >> isOpen [

	"Report whether the Channel is open between RsrSessions."

	^ self subclassResponsibility
]

{ #category : 'accessing' }
RsrChannel >> log [

	^self rsrSession log
]

{ #category : 'lifecycle' }
RsrChannel >> open [
	"Ensure the channel is open and ready for communication."

	^self subclassResponsibility
]

{ #category : 'events' }
RsrChannel >> received: aCommand [
	"A command has come in over the channel. Propogate it to the Connection."

	self rsrSession _receivedCommand: aCommand
]

{ #category : 'accessing' }
RsrChannel >> rsrSession [

	^rsrSession
]

{ #category : 'accessing' }
RsrChannel >> rsrSession: anRsrSession [

	rsrSession := anRsrSession
]

{ #category : 'events' }
RsrChannel >> send: aCommand [
	"Send the provided command over the channel."

	^self subclassResponsibility
]
