"
No class-specific documentation for RsrInstrumentedService, hierarchy is:
Object
  RsrObject
    RsrAbstractService
      RsrService( _id _connection remoteSelf)
        RsrInstrumentedService( sharedVariable preUpdateAction postUpdateAction)

"
Class {
	#name : 'RsrInstrumentedService',
	#superclass : 'RsrService',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrInstrumentedService class >> clientClassName [

	^#RsrInstrumentedClient
]

{ #category : 'accessing' }
RsrInstrumentedService class >> serverClassName [

	^#RsrInstrumentedServer
]

{ #category : 'accessing' }
RsrInstrumentedService class >> templateClassName [

	^#RsrInstrumentedService
]

{ #category : 'events' }
RsrInstrumentedService >> postRegistration [

	self postRegistrationCount: self postRegistrationCount + 1
]

{ #category : 'events' }
RsrInstrumentedService >> postUpdate [

	self postUpdateCount: self postUpdateCount + 1
]

{ #category : 'events' }
RsrInstrumentedService >> preUpdate [

	self preUpdateCount: self preUpdateCount + 1
]
