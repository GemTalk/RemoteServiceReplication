"
No class-specific documentation for RsrFalseReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrFalseReference

"
Class {
	#name : 'RsrFalseReference',
	#superclass : 'RsrBooleanReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'accessing' }
RsrFalseReference class >> typeIdentifier [

	^8
]

{ #category : 'resolving' }
RsrFalseReference >> resolve: anRsrSession [

	^false
]
