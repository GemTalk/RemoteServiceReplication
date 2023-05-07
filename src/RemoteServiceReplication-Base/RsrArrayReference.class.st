"
No class-specific documentation for RsrArrayReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrArrayReference

"
Class {
	#name : 'RsrArrayReference',
	#superclass : 'RsrCollectionReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'accessing' }
RsrArrayReference class >> typeIdentifier [

	^9
]

{ #category : 'resolving' }
RsrArrayReference >> resolve: anRsrSession [

	^intermediate collect: [:each | each resolve: anRsrSession]
]
