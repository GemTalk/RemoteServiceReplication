"
No class-specific documentation for RsrServiceReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrServiceReference( sid)

"
Class {
	#name : 'RsrServiceReference',
	#superclass : 'RsrReference',
	#instVars : [
		'sid'
	],
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'analyzing' }
RsrServiceReference class >> analyze: aService
using: anAnalyzer [

	^anAnalyzer analyzeService: aService
]

{ #category : 'instance creation' }
RsrServiceReference class >> from: aService [

	^self sid: aService _id
]

{ #category : 'instance creation' }
RsrServiceReference class >> sid: aServiceID [

	^self new
		sid: aServiceID;
		yourself
]

{ #category : 'encoding/decoding' }
RsrServiceReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeControlWord: self sid
		onto: aStream
]

{ #category : 'resolving' }
RsrServiceReference >> resolve: anRsrSession [

	^anRsrSession serviceAt: self sid
]

{ #category : 'accessing' }
RsrServiceReference >> sid [

	^sid
]

{ #category : 'accessing' }
RsrServiceReference >> sid: aServiceID [

	sid := aServiceID
]
