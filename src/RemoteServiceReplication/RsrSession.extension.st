Extension { #name : 'RsrSession' }

{ #category : '*remoteservicereplication' }
RsrSession >> _ensureRegistered: aService [
	aService _rsrSession == nil
		ifTrue: [ 
			self _register: aService as: oidSpigot next.
			aService postRegistration.
			^ self ].
	aService _rsrSession == self
		ifFalse: [ ^ RsrAlreadyRegistered signalService: aService intendedRsrSession: self ]
]

{ #category : '*remoteservicereplication' }
RsrSession >> _forwarderClass [

	^RsrForwarder
]

{ #category : '*remoteservicereplication' }
RsrSession >> _receivedCommand: aCommand [
	"Execute the command in the context of the receiving RsrSession."

	RsrProcessModel
		fork:
			[RsrProcessModel configureFrameworkProcess.
			aCommand executeFor: self]
		named: 'Processing ', aCommand class name
]

{ #category : '*remoteservicereplication' }
RsrSession >> _register: aService
as: sid [

	| registryEntry mournAction |
	aService
		_id: sid
		session: self.
	mournAction := aService isClient
		ifTrue: [self mournActionForClientSID: sid]
		ifFalse: [self mournActionForServerSID: sid].
	registryEntry := RsrRegistryEntry
		service: aService
		onMourn: mournAction.
	registry
		at: sid
		put: registryEntry
]

{ #category : '*remoteservicereplication' }
RsrSession >> _releaseSID: aSID [

	| command |
	self isOpen
		ifFalse: [^self].
	self log trace: 'Cleaning up OID:', aSID printString.
	command := RsrReleaseServices sids: (Array with: aSID).
	self _sendCommand: command
]

{ #category : '*remoteservicereplication' }
RsrSession >> _remoteClientReleased: aSID [
	"Remotely, a Client instance has been garbage collected.
	Ensure we only reference the associated service weakly."

	| entry |
	entry := registry
		at: aSID
		ifAbsent: [^self].
	entry becomeWeak.
]

{ #category : '*remoteservicereplication' }
RsrSession >> _sendCommand: aCommand [
	"Send the provided Command to our peer."

	channel send: aCommand
]

{ #category : '*remoteservicereplication' }
RsrSession >> _sendMessage: aMessage
to: aService [

"Open coordination window"
	"Send dirty transitive closure of aRemoteMessage"
	"Send DispatchMessage command"
"Coorination window closed"
	"Return Promise"
	| analysis receiverReference selectorReference argumentReferences dispatchCommand promise pendingMessage |
	self isOpen
		ifFalse: [self error: 'Session is not open'].
	analysis := RsrSnapshotAnalysis
		roots: (Array with: aService), aMessage arguments
		rsrSession: self.
	analysis perform.
	receiverReference := RsrReference from: aService.
	selectorReference := RsrReference from: aMessage selector.
	argumentReferences := aMessage arguments collect: [:each | RsrReference from: each].
	dispatchCommand := RsrSendMessage
		transaction: self transactionSpigot next
		receiverReference: receiverReference
		selectorReference: selectorReference
		argumentReferences: argumentReferences.
	dispatchCommand snapshots: analysis snapshots.
	promise := RsrPromise new.
	pendingMessage := RsrPendingMessage
		services: nil "I don't think we need to cache services here. They will remain on the stack unless they were removed from the transitive closure by another proc"
		promise: promise.
	self pendingMessages
		at: dispatchCommand transaction
		put: pendingMessage.
	self _sendCommand: dispatchCommand.
	^promise
]

{ #category : '*remoteservicereplication' }
RsrSession >> _stronglyRetain: aServer [
	"Retain the already registered server strongly."

	| entry |
	entry := registry
		at: aServer _id
		ifAbsent: [RsrUnknownSID signal: aServer _id printString].
	entry becomeStrong
]

{ #category : '*remoteservicereplication' }
RsrSession >> channel [

	^channel
]

{ #category : '*remoteservicereplication' }
RsrSession >> channel: aChannel [

	channel := aChannel.
	channel rsrSession: self
]

{ #category : '*remoteservicereplication' }
RsrSession >> channelDisconnected [

	self log info: 'Disconnected'.
	self close
]

{ #category : '*remoteservicereplication' }
RsrSession >> initialize [

	super initialize.
	transactionSpigot := RsrThreadSafeNumericSpigot naturals.
	pendingMessages := RsrThreadSafeDictionary new.
	registry := RsrThreadSafeDictionary new.
	log := RsrLog new.
	announcer := Announcer new.
	templateResolver := RsrTemplateResolver new.
	policy := RsrDefaultPolicy new
]

{ #category : '*remoteservicereplication' }
RsrSession >> log [

	^log
]

{ #category : '*remoteservicereplication' }
RsrSession >> mournActionForClientSID: aSID [

	^[registry removeKey: aSID.
			self _releaseSID: aSID]
]

{ #category : '*remoteservicereplication' }
RsrSession >> mournActionForServerSID: aSID [

	^[registry removeKey: aSID]
]

{ #category : '*remoteservicereplication' }
RsrSession >> oidSpigot [

	^oidSpigot
]

{ #category : '*remoteservicereplication' }
RsrSession >> oidSpigot: anIntegerSpigot [

	oidSpigot := anIntegerSpigot
]

{ #category : '*remoteservicereplication' }
RsrSession >> pendingMessages [

	^pendingMessages
]

{ #category : '*remoteservicereplication' }
RsrSession >> serviceAt: aSID [

	^self
		serviceAt: aSID
		ifAbsent: [RsrUnknownSID signal: aSID printString]
]

{ #category : '*remoteservicereplication' }
RsrSession >> serviceAt: aSID
ifAbsent: aBlock [
	"Return the service associated with the provided SID."

	| entry |
	entry := registry at: aSID ifAbsent: [nil].
	"Ensure we do not hold the lock for long."
	entry == nil
		ifTrue: [^aBlock value].
	"The Service may have been garbage collected but
	the entry may not yet be removed. Ensure we
	evaluate the block in that case as well."
	^entry service
		ifNil: aBlock
		ifNotNil: [:service | service]
]

{ #category : '*remoteservicereplication' }
RsrSession >> transactionSpigot [

	^transactionSpigot
]

{ #category : '*remoteservicereplication' }
RsrSession >> transactionSpigot: anObject [

	transactionSpigot := anObject
]

{ #category : '*remoteservicereplication' }
RsrSession >> unknownError: anException [

	self close
]
