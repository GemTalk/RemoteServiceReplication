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
		'persona',
		'slots'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
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

	| currentClass variables templateResolver template |
	variables := OrderedCollection new.
	templateResolver := aService _connection templateResolver.
	template := templateResolver templateFor: aService.
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
RsrServiceSnapshot >> createInstanceRegisteredIn: aConnection [

	| templateResolver template instanceClass instance |
	templateResolver := aConnection templateResolver.
	template := templateResolver templateNamed: self templateName.
	((aConnection policy permits: template) or: [template inheritsFrom: RsrReasonService])
		ifFalse: [RsrServiceRejected signalReason: (RsrPolicyRejectedService sid: sid templateName: templateName)].
	instanceClass := self shouldCreateServer
		ifTrue: [templateResolver serverClassForTemplate: template]
		ifFalse: [templateResolver clientClassForTemplate: template].
	instance := instanceClass basicNew.
	aConnection
		_register: instance
		as: self sid.
	^instance
]

{ #category : 'accessing' }
RsrServiceSnapshot >> instanceIn: aConnection [

	| instance |
	instance := aConnection
		serviceAt: self sid
		ifAbsent: [self createInstanceRegisteredIn: aConnection].
	self shouldCreateServer
		ifTrue: [aConnection _stronglyRetain: instance].
	^instance
]

{ #category : 'accessing' }
RsrServiceSnapshot >> persona [
	"What persona should be used when this ServiceSnapshot is reified?"
	
	^persona
]

{ #category : 'accessing' }
RsrServiceSnapshot >> persona: aSymbol [
	"What persona should be used when this ServiceSnapshot is reified?"
	
	persona := aSymbol
]

{ #category : 'accessing' }
RsrServiceSnapshot >> personaReference [
	"What persona should be used when this ServiceSnapshot is reified?
	As an RsrReference object."
	
	^RsrSymbolReference from: self persona
]

{ #category : 'reifying' }
RsrServiceSnapshot >> reifyIn: aConnection [

	| instance referenceStream |
	instance := self instanceIn: aConnection.
	(self class reflectedVariablesFor: instance) size = slots size 
		ifFalse: [ self error: 'Expected ', (self class reflectedVariablesFor: instance) size printString, ' value(s) for template ', templateName, ' but received ', slots size printString, ' value(s) instead. Verify peers have compatible template definitions.'  ].
	referenceStream := ReadStream on: slots.
	self class reflectedVariableIndicesFor: instance do: [ :index | 
		instance
			instVarAt: index
			put: (referenceStream next resolve: aConnection) ].
	^ instance
]

{ #category : 'testing' }
RsrServiceSnapshot >> shouldCreateServer [

	^persona == #server
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

{ #category : 'snapshotting' }
RsrServiceSnapshot >> snapshot: aService [

	| templateResolver template |
	templateResolver := aService _connection templateResolver.
	template := templateResolver templateFor: aService.
	sid := aService _id.
	templateName := template name.
	"If I am snapshotting a Client, the Snapshot represents a Server."
	persona := aService class isClientClass
		ifTrue: [ #server ]
		ifFalse: [ #client ].
	slots := OrderedCollection new.
	self class
		reflectedVariablesFor: aService
		do: [:each | slots add: (RsrReference from: each)]
]

{ #category : 'accessing' }
RsrServiceSnapshot >> templateName [

	^templateName
]

{ #category : 'accessing' }
RsrServiceSnapshot >> templateName: aSymbol [

	templateName := aSymbol
]

{ #category : 'accessing' }
RsrServiceSnapshot >> templateNameReference [

	^RsrSymbolReference from: self templateName
]
