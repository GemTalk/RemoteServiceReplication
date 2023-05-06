"
I represent a class of Objects that know offer Rsr Services.
"
Class {
	#name : 'RsrService',
	#superclass : 'RsrAbstractService',
	#instVars : [
		'_id',
		'remoteSelf',
		'_rsrSession'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrService class >> _id: anId
connection: aConnection [

	^super new
		_id: anId connection: aConnection;
		yourself
]

{ #category : 'accessing' }
RsrService class >> clientClass [

	^RsrClassResolver classNamed: self clientClassName
]

{ #category : 'accessing' }
RsrService class >> clientClassName [

	^(self templateClassName, 'Client') asSymbol
]

{ #category : 'testing' }
RsrService class >> isClientClass [

	^self name == self clientClassName
]

{ #category : 'testing' }
RsrService class >> isServerClass [

	^self name == self serverClassName
]

{ #category : 'testing' }
RsrService class >> isTemplateClass [

	^self name == self templateClassName
]

{ #category : 'accessing' }
RsrService class >> serverClass [

	^RsrClassResolver classNamed: self serverClassName
]

{ #category : 'accessing' }
RsrService class >> serverClassName [

	^(self templateClassName, 'Server') asSymbol
]

{ #category : 'accessing' }
RsrService class >> templateClass [

	^RsrClassResolver classNamed: self templateClassName
]

{ #category : 'accessing' }
RsrService class >> templateClassName [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
RsrService >> _id [
	"Private - Returns the Service ID associated w/ the receiver."

	^_id
]

{ #category : 'private-accessing' }
RsrService >> _id: anRsrId
connection: aConnection [
	"Private - Configure this Service w/ a Service ID and Connection. This is a side-effect of registering a Service w/ a Connection."

	_id := anRsrId.
	_rsrSession := aConnection.
	remoteSelf := aConnection _forwarderClass on: self
]

{ #category : 'private-accessing' }
RsrService >> _rsrSession [
	"Private - Returns the Connection associated w/ the receiver."

	^_rsrSession
]

{ #category : 'private-synchronization' }
RsrService >> _synchronize [
	"Return self to synchronize with the remote peer"

	^self
]

{ #category : 'private-accessing' }
RsrService >> _template [
	"Returns the template associated with this Service. General users should use #template."

	^_rsrSession templateResolver templateFor: self
]

{ #category : 'public-events' }
RsrService >> configureProcess [
	"#configureProcess is called each time the framework calls into the framework to evaluate generic user code.
	#preUpdate and #postUpdate run in a configuration manner prescribed by the framework."

	Processor activeProcess
		priority: self serviceSchedulingPriority
]

{ #category : 'public-debugging' }
RsrService >> debug: anException
raisedDuring: aMessageSend
answerUsing: aResolver [

	aResolver break: (RsrRemoteException from: anException)
]

{ #category : 'public-accessing' }
RsrService >> id [
	"Returns the Service ID associated w/ the receiver."

	^self _id
]

{ #category : 'public-testing' }
RsrService >> isClient [

	^self class isClientClass
]

{ #category : 'public-testing' }
RsrService >> isMirrored [

	^_rsrSession ~~ nil
]

{ #category : 'public-testing' }
RsrService >> isNotMirrored [

	^self isMirrored not
]

{ #category : 'public-testing' }
RsrService >> isServer [

	^self class isServerClass
]

{ #category : 'public-events' }
RsrService >> postRegistration [
	"This message is sent immediately after the Service
	is registered with a Connection for the first time.

	The framework views both Client and Server peers as
	the same object. When a peer is created by the
	framework, it will not receive #postRegistration."

	^self
]

{ #category : 'public-events' }
RsrService >> postUpdate [
	"#postUpdate is called just after the Service's shared variables are updated by the framework.
	This method can be overridden to ensure internal consistency."

	^self
]

{ #category : 'public-events' }
RsrService >> preUpdate [
	"#preUpdate is called just before the Service's shared variables are updated by the framework.
	This method can be overridden to ensure internal consistency.
	Note: If this method raises an exception, RSR will not signal #postUpdate."

	^self
]

{ #category : 'public-registration' }
RsrService >> registerWith: aConnection [

	aConnection _ensureRegistered: self
]

{ #category : 'public-accessing' }
RsrService >> rsrSession [
	"Returns the Connection associated w/ the receiver."

	^self _rsrSession
]

{ #category : 'public-events' }
RsrService >> serviceSchedulingPriority [

	^Processor userSchedulingPriority
]

{ #category : 'public-synchronization' }
RsrService >> synchronize [
	"Synchronize the service w/ its peer."

	remoteSelf == nil
		ifFalse: [remoteSelf _synchronize wait]
]

{ #category : 'public-accessing' }
RsrService >> template [
	"Returns the template associated with this Service.
	This method should NOT be redefined."

	^self _template
]
