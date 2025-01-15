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

	^aBoolean
		ifTrue: [RsrTrueReference new]
		ifFalse: [RsrFalseReference new]
]
