Extension { #name : 'RsrConnection' }

{ #category : '*remoteservicereplication' }
RsrConnection >> _ensureRegistered: aService [
	aService _rsrSession == nil
		ifTrue: [ 
			self _register: aService as: oidSpigot next.
			aService postRegistration.
			^ self ].
	aService _rsrSession == self
		ifFalse: [ ^ RsrAlreadyRegistered signalService: aService intendedRsrSession: self ]
]

{ #category : '*remoteservicereplication' }
RsrConnection >> _forwarderClass [

	^RsrForwarder
]

{ #category : '*remoteservicereplication' }
RsrConnection >> _receivedCommand: aCommand [
	"Execute the command in the context of the receiving Connection."

	RsrProcessModel
		fork:
			[RsrProcessModel configureFrameworkProcess.
			aCommand executeFor: self]
		named: 'Processing ', aCommand class name
]

{ #category : '*remoteservicereplication' }
RsrConnection >> _register: aService
as: sid [

	| registryEntry mournAction |
	aService
		_id: sid
		connection: self.
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
RsrConnection >> _releaseSID: aSID [

	| command |
	self isOpen
		ifFalse: [^self].
	self log trace: 'Cleaning up OID:', aSID printString.
	command := RsrReleaseServices sids: (Array with: aSID).
	self _sendCommand: command
]

{ #category : '*remoteservicereplication' }
RsrConnection >> _remoteClientReleased: aSID [
	"Remotely, a Client instance has been garbage collected.
	Ensure we only reference the associated service weakly."

	| entry |
	entry := registry
		at: aSID
		ifAbsent: [^self].
	entry becomeWeak.
]

{ #category : '*remoteservicereplication' }
RsrConnection >> _sendCommand: aCommand [
	"Send the provided Command to our peer."

	channel send: aCommand
]

{ #category : '*remoteservicereplication' }
RsrConnection >> _sendMessage: aMessage
to: aService [

"Open coordination window"
	"Send dirty transitive closure of aRemoteMessage"
	"Send DispatchMessage command"
"Coorination window closed"
	"Return Promise"
	| analysis receiverReference selectorReference argumentReferences dispatchCommand promise pendingMessage |
	self isOpen
		ifFalse: [self error: 'Connection is not open'].
	analysis := RsrSnapshotAnalysis
		roots: (Array with: aService), aMessage arguments
		connection: self.
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
RsrConnection >> _stronglyRetain: aServer [
	"Retain the already registered server strongly."

	| entry |
	entry := registry
		at: aServer _id
		ifAbsent: [RsrUnknownSID signal: aServer _id printString].
	entry becomeStrong
]

{ #category : '*remoteservicereplication' }
RsrConnection >> channel [

	^channel
]

{ #category : '*remoteservicereplication' }
RsrConnection >> channel: aChannel [

	channel := aChannel.
	channel connection: self
]

{ #category : '*remoteservicereplication' }
RsrConnection >> channelDisconnected [

	self log info: 'Disconnected'.
	self close
]

{ #category : '*remoteservicereplication' }
RsrConnection >> initialize [

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
RsrConnection >> log [

	^log
]

{ #category : '*remoteservicereplication' }
RsrConnection >> mournActionForClientSID: aSID [

	^[registry removeKey: aSID.
			self _releaseSID: aSID]
]

{ #category : '*remoteservicereplication' }
RsrConnection >> mournActionForServerSID: aSID [

	^[registry removeKey: aSID]
]

{ #category : '*remoteservicereplication' }
RsrConnection >> oidSpigot [

	^oidSpigot
]

{ #category : '*remoteservicereplication' }
RsrConnection >> oidSpigot: anIntegerSpigot [

	oidSpigot := anIntegerSpigot
]

{ #category : '*remoteservicereplication' }
RsrConnection >> pendingMessages [

	^pendingMessages
]

{ #category : '*remoteservicereplication' }
RsrConnection >> serviceAt: aSID [

	^self
		serviceAt: aSID
		ifAbsent: [RsrUnknownSID signal: aSID printString]
]

{ #category : '*remoteservicereplication' }
RsrConnection >> serviceAt: aSID
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
RsrConnection >> transactionSpigot [

	^transactionSpigot
]

{ #category : '*remoteservicereplication' }
RsrConnection >> transactionSpigot: anObject [

	transactionSpigot := anObject
]

{ #category : '*remoteservicereplication' }
RsrConnection >> unknownError: anException [

	self close
]
