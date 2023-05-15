Class {
	#name : 'RsrObsoleteChannel',
	#superclass : 'RsrObject',
	#instVars : [
		'rsrSession'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'private' }
RsrObsoleteChannel class >> integerLimit [

	"Answer a large number that is a SmallInteger on all supported 64-bit platforms"

	^ 16rFFFFFFFFFFFFFFF
]

{ #category : 'private' }
RsrObsoleteChannel class >> negativeIdRange [

	^ -1 to: self integerLimit negated by: -1
]

{ #category : 'private' }
RsrObsoleteChannel class >> positiveIdRange [

	^ 1 to: self integerLimit by: 1
]

{ #category : 'accessing' }
RsrObsoleteChannel >> addCommunicationProcessesTo: aSet [
	"Add all processes used for Communication to the provided set."
	
	self subclassResponsibility
]

{ #category : 'lifecycle' }
RsrObsoleteChannel >> close [
	"Ensure the channel is closed to further communication."

	^self subclassResponsibility
]

{ #category : 'events' }
RsrObsoleteChannel >> genericError: anError [

	^self rsrSession unknownError: anError
]

{ #category : 'accessing' }
RsrObsoleteChannel >> idInterval [

	"Answer an Interval that defines acceptable unique IDs for my Session.
	All elements must be integers, and must be distinct from the interval 
	used by the other ends of this Channel."

	^ self subclassResponsibility
]

{ #category : 'testing' }
RsrObsoleteChannel >> isConnected [
	"Report whether the Channel is open between Connections."

	^self subclassResponsibility
]

{ #category : 'testing' }
RsrObsoleteChannel >> isOpen [

	"Report whether the Channel is open between RsrSessions."

	^ self subclassResponsibility
]

{ #category : 'accessing' }
RsrObsoleteChannel >> log [

	^self rsrSession log
]

{ #category : 'lifecycle' }
RsrObsoleteChannel >> open [
	"Ensure the channel is open and ready for communication."

	^self subclassResponsibility
]

{ #category : 'lifecycle' }
RsrObsoleteChannel >> openRsrSession [

	"Create and answer an RsrSession with the receiver as its channel."

	^ RsrSession forChannel: self
]

{ #category : 'events' }
RsrObsoleteChannel >> received: aCommand [
	"A command has come in over the channel. Propagate it to the Session."

	self rsrSession _receivedCommand: aCommand
]

{ #category : 'accessing' }
RsrObsoleteChannel >> rsrSession [

	^rsrSession
]

{ #category : 'accessing' }
RsrObsoleteChannel >> rsrSession: anRsrSession [

	rsrSession := anRsrSession
]

{ #category : 'events' }
RsrObsoleteChannel >> send: aCommand [
	"Send the provided command over the channel."

	^self subclassResponsibility
]
