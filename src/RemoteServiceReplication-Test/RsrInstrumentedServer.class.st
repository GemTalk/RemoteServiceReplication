"
No class-specific documentation for RsrInstrumentedServer, hierarchy is:
Object
  RsrObject
    RsrAbstractService
      RsrService( _id _connection remoteSelf)
        RsrInstrumentedService
          RsrInstrumentedServer( preUpdateAction postUpdateAction)

"
Class {
	#name : 'RsrInstrumentedServer',
	#superclass : 'RsrInstrumentedService',
	#instVars : [
		'preUpdateCount',
		'postUpdateCount',
		'postRegistrationCount',
		'action'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrInstrumentedServer >> action [

	^action
]

{ #category : 'accessing' }
RsrInstrumentedServer >> action: aBlock [

	action := aBlock
]

{ #category : 'evaluating' }
RsrInstrumentedServer >> evaluateAction [

	^self action value
]

{ #category : 'evaluating' }
RsrInstrumentedServer >> evaluateAction: anObject [

	^self action cull: anObject
]

{ #category : 'accessing' }
RsrInstrumentedServer >> postRegistrationCount [

	^postRegistrationCount ifNil: [0]
]

{ #category : 'accessing' }
RsrInstrumentedServer >> postRegistrationCount: anInteger [

	postRegistrationCount := anInteger
]

{ #category : 'accessing' }
RsrInstrumentedServer >> postUpdateCount [

	^postUpdateCount ifNil: [0]
]

{ #category : 'accessing' }
RsrInstrumentedServer >> postUpdateCount: anInteger [

	postUpdateCount := anInteger
]

{ #category : 'accessing' }
RsrInstrumentedServer >> preUpdateCount [

	^preUpdateCount ifNil: [0]
]

{ #category : 'accessing' }
RsrInstrumentedServer >> preUpdateCount: anInteger [

	preUpdateCount := anInteger
]

{ #category : 'evaluating' }
RsrInstrumentedServer >> return: anObject [

	^anObject
]
