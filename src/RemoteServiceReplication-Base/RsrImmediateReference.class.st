"
No class-specific documentation for RsrImmediateReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference( value)

"
Class {
	#name : 'RsrImmediateReference',
	#superclass : 'RsrReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'analyzing' }
RsrImmediateReference class >> analyze: anObject
using: anAnalyzer [

	^anAnalyzer analyzeImmediate: anObject
]

{ #category : 'instance creation' }
RsrImmediateReference class >> from: anObject [

	^self subclassResponsiblity
]

{ #category : 'accessing' }
RsrImmediateReference >> immediateOID [

	^0
]
