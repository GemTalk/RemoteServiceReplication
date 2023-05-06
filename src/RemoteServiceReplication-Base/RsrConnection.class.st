"
Connection is the central mediator for RSR. When using the framework, an associated application will hold onto Connection. When terminating or otherwise done with RSR, it will close the Connection to signal this.

Connection offers a limited public interface. The private methods are subject to change and shouldn't be used by any application.

The Connection can be monitored by subscribing to any of the Announcements defined under ConnectionStateAnnouncement. See #announcer.

The Connection is generally created indirectly via one of the ConnectionSpecification subclasses.
"
Class {
	#name : 'RsrConnection',
	#superclass : 'RsrObject',
	#instVars : [
		'channel',
		'transactionSpigot',
		'oidSpigot',
		'log',
		'registry',
		'pendingMessages',
		'specification',
		'announcer',
		'templateResolver',
		'policy'
	],
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrConnection class >> channel: aChannel
transactionSpigot: aNumericSpigot
oidSpigot: anOidSpigot [
	"Create a new Connection with an already Configured Channel.
	Provide spigots as their behavior is specified by the Channel creation
	protocols."

	^self
		specification: nil
		channel: aChannel
		transactionSpigot: aNumericSpigot
		oidSpigot: anOidSpigot
]

{ #category : 'instance creation' }
RsrConnection class >> new [
	"Instances of Connection should not be created via #new.
	Instead use ConnectionSpecification.
	See SystemTestCase>>#setUp for an example."

	self shouldNotImplement
]

{ #category : 'instance creation' }
RsrConnection class >> specification: aConnectionSpecification
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
RsrConnection >> announcer [
	"Returns the announcer used by RSR to announce events."

	^announcer
]

{ #category : 'public-lifecycle' }
RsrConnection >> close [

	| pm temp |
	channel close.
	temp := Dictionary new.
	pm := pendingMessages.
	pendingMessages := temp.
	pm do: [:each | each promise break: RsrConnectionClosedBeforeReceivingResponse new].
	registry := RsrThreadSafeDictionary new.
	announcer announce: (RsrSessionClosed connection: self)
]

{ #category : 'public-testing' }
RsrConnection >> isOpen [

	^channel isConnected
]

{ #category : 'public-lifecycle' }
RsrConnection >> open [

	self platformSpecificOpeningTasks.
	channel open
]

{ #category : 'public-accessing' }
RsrConnection >> policy [
	"Policy which determines if we can reify a received Service."

	^policy
]

{ #category : 'public-accessing' }
RsrConnection >> policy: aPolicy [
	"Policy which determines if we can reify a received Service."

	policy := aPolicy
]

{ #category : 'public-accessing' }
RsrConnection >> specification [
	"Returns the Specification used to create this Connection.
	If the Connection was not create using a Specification, returns nil."

	^specification
]

{ #category : 'public-accessing' }
RsrConnection >> specification: aConnectionSpecification [
	"Store the Specification used to the create this Connection."

	specification := aConnectionSpecification
]

{ #category : 'public-accessing' }
RsrConnection >> templateResolver [
	"Returns the TemplateResolver used to lookup a template by name or Service."

	^templateResolver
]

{ #category : 'public-accessing' }
RsrConnection >> templateResolver: aTemplateResolver [
	"Sets the TemplateResolver, used to lookup a template by name or Service,
	to a custom version."

	templateResolver := aTemplateResolver
]

{ #category : 'public-accessing' }
RsrConnection >> vitalProcesses [
	"Return the set of processes required in order for this RSR connection to function.
	This may be a subset of the processes used by RSR.
	For instance, in GemStone, this need not return the ephemeron mourning
	process as this isn't critical to the basic functioning of RSR."

	| processes |
	processes := IdentitySet new.
	channel addCommunicationProcessesTo: processes.
	^processes
]

{ #category : 'public-waiting' }
RsrConnection >> waitUntilClose [

	| semaphore |
	semaphore := Semaphore new.
	announcer
		when: RsrSessionClosed
		send: #signal
		to: semaphore.
	semaphore wait
]
