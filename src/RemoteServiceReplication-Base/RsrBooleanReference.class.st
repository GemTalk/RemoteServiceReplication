"
No class-specific documentation for RsrBooleanReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrBooleanReference

"
Class {
	#name : 'RsrBooleanReference',
	#superclass : 'RsrImmediateReference',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrBooleanReference class >> from: aBoolean [

	"True and False are Boolean instances in GemStone. This correctly distinguishes
	the appropriate subclass in all Smalltalk environments."
	^aBoolean
		ifTrue: [RsrTrueReference new]
		ifFalse: [RsrFalseReference new]
]
