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
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'accessing' }
RsrOrderedCollectionReference class >> typeIdentifier [

	^12
]

{ #category : 'other' }
RsrOrderedCollectionReference >> resolve: aConnection [

	| oc |
	oc := OrderedCollection new: intermediate size.
	intermediate do: [:each | oc add: (each resolve: aConnection)].
	^oc
]
