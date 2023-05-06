"
RsrServiceSnapshot

When a SendMessage or DeliverResponse command is processed, the entire transition closure of the MessageSend/Response is analyzed.

A Snapshot of each Service found during this process is taken. The slots of the Service that need to be replicated are stored in the ServiceSnapshot as references.

In addition, information about the template and service is stored. This allows the peer to reify the correct type of Service. For instance, a local Client will be a Server remotely. A local Server will become a remote Client.

Collaborators:
- Encoder
- Decoder
- Reference
"
Class {
	#name : 'RsrServiceSnapshot',
	#superclass : 'RsrObject',
	#instVars : [
		'sid',
		'templateName',
		'shouldCreateServer',
		'slots'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrServiceSnapshot class >> from: aService [

	^self new
		snapshot: aService;
		yourself
]

{ #category : 'variable utilites' }
RsrServiceSnapshot class >> reflectedVariableIndicesFor: aService
do: aBlock [

	| allVariables |
	allVariables := aService class allInstVarNames.
	(self reflectedVariablesFor: aService)
		do:
			[:varName | | index |
			index := allVariables indexOf: varName.
			aBlock value: index]
]

{ #category : 'variable utilites' }
RsrServiceSnapshot class >> reflectedVariablesFor: aService [

	| currentClass variables template |
	variables := OrderedCollection new.
	template := aService _template.
	currentClass := template.
	[currentClass == RsrService]
		whileFalse:
			[currentClass instVarNames reverseDo: [:each | variables addFirst: each].
			currentClass := currentClass superclass].
	^variables
]

{ #category : 'variable utilites' }
RsrServiceSnapshot class >> reflectedVariablesFor: aService
do: aBlock [

	self
		reflectedVariableIndicesFor: aService
		do: [:index | aBlock value: (aService instVarAt: index)]
]

{ #category : 'accessing' }
RsrServiceSnapshot >> createInstanceRegisteredIn: anRsrSession [

	| instance template |
	templateName isNil
		ifTrue:
			[self flag: 'This should go away once we cleanup the on-the-wire encoding.'.
			RsrUnknownClass signal].
	template := anRsrSession templateResolver templateNamed: self templateName.
	((anRsrSession policy permits: template) or: [template inheritsFrom: RsrReasonService])
		ifFalse: [RsrServiceRejected signalReason: (RsrPolicyRejectedService sid: sid templateName: templateName)].
	instance := self shouldCreateServer
		ifTrue: [template serverClass basicNew]
		ifFalse: [template clientClass basicNew].
	anRsrSession
		_register: instance
		as: self sid.
	^instance
]

{ #category : 'other' }
RsrServiceSnapshot >> decode: aStream
using: aDecoder [

	| species instVarCount targetClassName resolver template |
	species := aDecoder decodeControlWord: aStream.
	sid := aDecoder decodeControlWord: aStream.
	instVarCount := aDecoder decodeControlWord: aStream.
	targetClassName := (aDecoder decodeReference: aStream) resolve: nil.
	slots := OrderedCollection new: instVarCount.
	instVarCount timesRepeat: [slots add: (aDecoder decodeReference: aStream)].
	resolver := RsrTemplateResolver new.
	template := resolver templateNamed: targetClassName ifAbsent: [^nil].
	templateName := template name.
	shouldCreateServer := template serverClassName = targetClassName.
]

{ #category : 'encoding/decoding' }
RsrServiceSnapshot >> encode: aStream
using: anEncoder [

	anEncoder
		encodeControlWord: self snapshotIdentifier
		onto: aStream.
	anEncoder
		encodeControlWord: self sid
		onto: aStream.
	anEncoder
		encodeControlWord: self slots size
		onto: aStream.
	self targetClassNameReference
		encode: aStream
		using: anEncoder.
	self slots do: [:each | each encode: aStream using: anEncoder]
]

{ #category : 'accessing' }
RsrServiceSnapshot >> instanceIn: anRsrSession [

	| instance |
	instance := anRsrSession
		serviceAt: self sid
		ifAbsent: [self createInstanceRegisteredIn: anRsrSession].
	self shouldCreateServer
		ifTrue: [anRsrSession _stronglyRetain: instance].
	^instance
]

{ #category : 'reifying' }
RsrServiceSnapshot >> reifyIn: aConnection [

	| instance referenceStream |
	instance := self instanceIn: aConnection.
	(self class reflectedVariablesFor: instance) size = slots size 
		ifFalse: [ self error: 'Incorrectly encoded instance detected' ].
	referenceStream := ReadStream on: slots.
	self class reflectedVariableIndicesFor: instance do: [ :index | 
		instance
			instVarAt: index
			put: (referenceStream next resolve: aConnection) ].
	^ instance
]

{ #category : 'testing' }
RsrServiceSnapshot >> shouldCreateServer [

	^shouldCreateServer
]

{ #category : 'accessing' }
RsrServiceSnapshot >> sid [

	^sid
]

{ #category : 'accessing' }
RsrServiceSnapshot >> sid: aServiceID [

	sid := aServiceID
]

{ #category : 'accessing' }
RsrServiceSnapshot >> slots [

	^slots
]

{ #category : 'accessing' }
RsrServiceSnapshot >> slots: anArrayOfReferences [

	slots := anArrayOfReferences
]

{ #category : 'other' }
RsrServiceSnapshot >> snapshot: aService [

	| template |
	template := aService _template.
	sid := aService _id.
	templateName := template name.
	"If I am snapshotting a Client, the Snapshot represents a Server."
	shouldCreateServer := aService class isClientClass.
	slots := OrderedCollection new.
	RsrServiceSnapshot
		reflectedVariablesFor: aService
		do: [:each | slots add: (RsrReference from: each)]
]

{ #category : 'accessing' }
RsrServiceSnapshot >> snapshotIdentifier [

	^0
]

{ #category : 'other' }
RsrServiceSnapshot >> targetClassName [

	| template |
	template := RsrTemplateResolver new templateNamed: self templateName.
	^self shouldCreateServer
		ifTrue: [template serverClassName]
		ifFalse: [template clientClassName]
]

{ #category : 'other' }
RsrServiceSnapshot >> targetClassNameReference [

	^RsrSymbolReference from: self targetClassName
]

{ #category : 'other' }
RsrServiceSnapshot >> templateName [

	^templateName
]
