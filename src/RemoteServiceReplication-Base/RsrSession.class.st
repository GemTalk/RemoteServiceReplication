"
RsrSession is the central mediator for RSR. When using the framework, an associated application will hold onto a Session. When terminating or otherwise done with RSR, it should close the Session.

RsrSession offers a limited public interface. The private methods are subject to change and shouldn't be used by any application.

A Session can be monitored by subscribing to any of the Announcements defined under RsrSessionStateAnnouncement. See #announcer.

A Session is generally created indirectly via one of the TransportTemplate subclasses.
"
Class {
	#name : 'RsrSession',
	#superclass : 'RsrObject',
	#instVars : [
		'channel',
		'transactionSpigot',
		'oidSpigot',
		'log',
		'registry',
		'pendingMessages',
		'announcer',
		'templateResolver',
		'policy'
	],
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrSession class >> channel: aChannel
transactionSpigot: aNumericSpigot
oidSpigot: anOidSpigot [
	"Create a new Session with an already Configured Channel.
	Provide spigots as their behavior is specified by the Channel creation
	protocols."

	^self
		specification: nil
		channel: aChannel
		transactionSpigot: aNumericSpigot
		oidSpigot: anOidSpigot
]

{ #category : 'instance creation' }
RsrSession class >> forChannel: aChannel [

	^ super new initializeForChannel: aChannel
]

{ #category : 'instance creation' }
RsrSession class >> new [
	"Instances of RsrSession should not be created via #new.
	Instead use a TransportTemplate or build from an open Channel.
	See SystemTestCase>>#setUp for an example."

	self shouldNotImplement
]

{ #category : 'instance creation' }
RsrSession class >> specification: aConnectionSpecification
channel: aChannel
transactionSpigot: aNumericSpigot
oidSpigot: anOidSpigot [
	"Create a new Connection with an already Configured Channel.
	Provide spigots as their behavior is specified by the Channel creation
	protocols."

	^super new
		specification: aConnectionSpecification;
		channel: aChannel;
		transactionSpigot: aNumericSpigot;
		oidSpigot: anOidSpigot;
		yourself
]

{ #category : 'public-accessing' }
RsrSession >> announcer [
	"Returns the announcer used by RSR to announce events."

	^announcer
]

{ #category : 'public-lifecycle' }
RsrSession >> close [

	| pm temp |
	channel close.
	temp := Dictionary new.
	pm := pendingMessages.
	pendingMessages := temp.
	pm do: [:each | each promise break: RsrSessionClosedBeforeReceivingResponse new].
	registry := RsrThreadSafeDictionary new.
	announcer announce: (RsrSessionClosed rsrSession: self)
]

{ #category : 'initialization' }
RsrSession >> initializeForChannel: aChannel [

	| idInterval |
	aChannel isOpen ifFalse: [ ^ RsrChannelNotOpen signal ].
	channel := aChannel.
	idInterval := channel idInterval.
	transactionSpigot := RsrThreadSafeNumericSpigot onInterval:
		                     idInterval.
	oidSpigot := RsrThreadSafeNumericSpigot onInterval: idInterval
]

{ #category : 'public-testing' }
RsrSession >> isOpen [

	^ channel isOpen
]

{ #category : 'public-lifecycle' }
RsrSession >> open [

	self platformSpecificOpeningTasks.
	channel open
]

{ #category : 'public-accessing' }
RsrSession >> policy [
	"Policy which determines if we can reify a received Service."

	^policy
]

{ #category : 'public-accessing' }
RsrSession >> policy: aPolicy [
	"Policy which determines if we can reify a received Service."

	policy := aPolicy
]

{ #category : 'public-accessing' }
RsrSession >> templateResolver [
	"Returns the TemplateResolver used to lookup a template by name or Service."

	^templateResolver
]

{ #category : 'public-accessing' }
RsrSession >> templateResolver: aTemplateResolver [
	"Sets the TemplateResolver, used to lookup a template by name or Service,
	to a custom version."

	templateResolver := aTemplateResolver
]

{ #category : 'public-accessing' }
RsrSession >> vitalProcesses [
	"Return the set of processes required in order for this RSR session to function.
	This may be a subset of the processes used by RSR.
	For instance, in GemStone, this need not return the ephemeron mourning
	process as this isn't critical to the basic functioning of RSR."

	| processes |
	processes := IdentitySet new.
	channel addCommunicationProcessesTo: processes.
	^processes
]

{ #category : 'public-waiting' }
RsrSession >> waitUntilClose [

	| semaphore |
	semaphore := Semaphore new.
	announcer
		when: RsrSessionClosed
		send: #signal
		to: semaphore.
	semaphore wait
]
