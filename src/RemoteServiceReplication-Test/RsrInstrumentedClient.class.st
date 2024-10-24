"
No class-specific documentation for RsrInstrumentedClient, hierarchy is:
Object
  RsrObject
    RsrAbstractService
      RsrService( _id _connection remoteSelf)
        RsrInstrumentedService
          RsrInstrumentedClient( preUpdateAction postUpdateAction)

"
Class {
	#name : 'RsrInstrumentedClient',
	#superclass : 'RsrInstrumentedService',
	#instVars : [
		'preUpdateCount',
		'postUpdateCount',
		'postRegistrationCount'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrInstrumentedClient >> postRegistrationCount [

	^postRegistrationCount ifNil: [0]
]

{ #category : 'accessing' }
RsrInstrumentedClient >> postRegistrationCount: anInteger [

	postRegistrationCount := anInteger
]

{ #category : 'accessing' }
RsrInstrumentedClient >> postUpdateCount [

	^postUpdateCount ifNil: [0]
]

{ #category : 'accessing' }
RsrInstrumentedClient >> postUpdateCount: anInteger [

	postUpdateCount := anInteger
]

{ #category : 'accessing' }
RsrInstrumentedClient >> preUpdateCount [

	^preUpdateCount ifNil: [0]
]

{ #category : 'accessing' }
RsrInstrumentedClient >> preUpdateCount: anInteger [

	preUpdateCount := anInteger
]

{ #category : 'evaluating' }
RsrInstrumentedClient >> return: anObject [

	^(remoteSelf return: anObject) wait
]

{ #category : 'evaluating' }
RsrInstrumentedClient >> value [

	^remoteSelf evaluateAction wait
]

{ #category : 'evaluating' }
RsrInstrumentedClient >> value: anObject [

	^(remoteSelf evaluateAction: anObject) wait
]
