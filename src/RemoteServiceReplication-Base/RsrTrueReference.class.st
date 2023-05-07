"
No class-specific documentation for RsrTrueReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference( value)
        RsrTrueReference

"
Class {
	#name : 'RsrTrueReference',
	#superclass : 'RsrBooleanReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'accessing' }
RsrTrueReference class >> typeIdentifier [

	^7
]

{ #category : 'resolving' }
RsrTrueReference >> resolve: anRsrSession [

	^true
]
