Class {
	#name : #RsrRetainAnalysis,
	#superclass : #Object,
	#instVars : [
		'roots',
		'retainCommands',
		'inFlight',
		'connection'
	],
	#category : #'RemoteServiceReplication-Communications'
}

{ #category : #'instance creation' }
RsrRetainAnalysis class >> roots: anArray
connection: aConnection [

	^self new
		roots: anArray;
		connection: aConnection;
		yourself
]

{ #category : #accessing }
RsrRetainAnalysis >> connection [

	^connection
]

{ #category : #accessing }
RsrRetainAnalysis >> connection: aConnection [

	connection := aConnection
]

{ #category : #accessing }
RsrRetainAnalysis >> encoder [

	^self connection encoder
]

{ #category : #actions }
RsrRetainAnalysis >> ensureRegistered: anRsrObject [

	anRsrObject isMirrored
		ifFalse:
			[anRsrObject
				rsrId: self nextOid;
				rsrConnection: self connection.
			anRsrObject registerWith: self registry]
]

{ #category : #initialization }
RsrRetainAnalysis >> initialize [

	super initialize.
	retainCommands := OrderedCollection new.
	inFlight := IdentitySet new
]

{ #category : #processing }
RsrRetainAnalysis >> isDataObject: anObject [

	^anObject == true
		or: [anObject == false
			or: [anObject == nil
				or: [anObject isString
					or: [anObject isSymbol
						or: [anObject isInteger]]]]]
]

{ #category : #testing }
RsrRetainAnalysis >> isImmediate: anObject [

	^self encoder isImmediate: anObject
]

{ #category : #testing }
RsrRetainAnalysis >> isRsrCollection: anObject [

	^anObject isKindOf: RsrCollection
]

{ #category : #processing }
RsrRetainAnalysis >> isRsrObject: anObject [

	^anObject isKindOf: RsrObject
]

{ #category : #accessing }
RsrRetainAnalysis >> nextOid [

	^self connection oidSpigot next
]

{ #category : #actions }
RsrRetainAnalysis >> perform [

	roots do: [:each | self process: each]
]

{ #category : #processing }
RsrRetainAnalysis >> process: anObject [

	(self isDataObject: anObject)
		ifTrue: [^self processDataObject: anObject].
	(self isRsrCollection: anObject)
		ifTrue: [^self processRsrCollection: anObject].
	(self isRsrObject: anObject)
		ifTrue: [^self processRsrObject: anObject].
	(self isImmediate: anObject)
		ifTrue: [^anObject].
	^RsrUnsupportedObject signal: 'Unsupported object (' , anObject printString , ')'
]

{ #category : #processing }
RsrRetainAnalysis >> processDataObject: aDataObject [

	^self
]

{ #category : #processing }
RsrRetainAnalysis >> processRsrCollection: aCollection [

	self
		processing: aCollection
		during: [aCollection do: [:each | self process: each]]
]

{ #category : #processing }
RsrRetainAnalysis >> processRsrObject: anRsrObject [

	self
		processing: anRsrObject
		during:
			[self
				reflectedVariablesOf: anRsrObject
				do: [:each | self process: each]]
]

{ #category : #processing }
RsrRetainAnalysis >> processing: anObject
during: aBlock [

	(inFlight includes: anObject)
		ifTrue: [^RsrCycleDetected signal: 'Cycled detected on: ', anObject printString].
	inFlight add: anObject.
	self ensureRegistered: anObject.
	aBlock value.
	self retain: anObject.
	inFlight remove: anObject
]

{ #category : #processing }
RsrRetainAnalysis >> reflectedVariablesOf: anRsrObject
do: aBlock [

	anRsrObject class variablesToReflect
		do:
			[:name |
			aBlock value: (anRsrObject instVarNamed: name)]
]

{ #category : #accessing }
RsrRetainAnalysis >> registry [

	^connection registry
]

{ #category : #actions }
RsrRetainAnalysis >> retain: anRsrObject [

	| retainCommand |
	retainCommand := RsrRetainObject object: anRsrObject.
	retainCommand encodeUsing: self encoder.
	self retainCommands add: retainCommand
]

{ #category : #actions }
RsrRetainAnalysis >> retainCommands [

	^retainCommands
]

{ #category : #accessing }
RsrRetainAnalysis >> roots [

	^roots
]

{ #category : #accessing }
RsrRetainAnalysis >> roots: anObject [

	roots := anObject
]