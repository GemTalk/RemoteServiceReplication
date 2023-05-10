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

{ #category : 'private' }
RsrChannel class >> integerLimit [

	"Answer a large number that is a SmallInteger on all supported 64-bit platforms"

	^ 16rFFFFFFFFFFFFFFF
]

{ #category : 'private' }
RsrChannel class >> negativeIdRange [

	^ -1 to: self integerLimit negated by: -1
]

{ #category : 'private' }
RsrChannel class >> positiveIdRange [

	^ 1 to: self integerLimit by: 1
]

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

{ #category : 'accessing' }
RsrChannel >> idInterval [

	"Answer an Interval that defines acceptable unique IDs for my Session.
	All elements must be integers, and must be distinct from the interval 
	used by the other ends of this Channel."

	^ self subclassResponsibility
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

{ #category : 'lifecycle' }
RsrChannel >> openRsrSession [

	"Create and answer an RsrSession with the receiver as its channel."

	^ RsrSession forChannel: self
]

{ #category : 'events' }
RsrChannel >> received: aCommand [
	"A command has come in over the channel. Propagate it to the Session."

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
