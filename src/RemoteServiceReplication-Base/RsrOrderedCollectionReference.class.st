"
No class-specific documentation for RsrOrderedCollectionReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrOrderedCollectionReference

"
Class {
	#name : 'RsrOrderedCollectionReference',
	#superclass : 'RsrCollectionReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'accessing' }
RsrOrderedCollectionReference class >> typeIdentifier [

	^12
]

{ #category : 'other' }
RsrOrderedCollectionReference >> resolve: anRsrSession [

	| oc |
	oc := OrderedCollection new: intermediate size.
	intermediate do: [:each | oc add: (each resolve: anRsrSession)].
	^oc
]
