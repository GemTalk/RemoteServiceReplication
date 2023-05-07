"
No class-specific documentation for RsrSetReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrSetReference

"
Class {
	#name : 'RsrSetReference',
	#superclass : 'RsrCollectionReference',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrSetReference class >> from: aSet [

	| referenceStream |
	referenceStream := WriteStream on: (Array new: aSet size).
	aSet do:  [:each | referenceStream nextPut: (RsrReference from: each)].
	^self intermediate: referenceStream contents
]

{ #category : 'accessing' }
RsrSetReference class >> typeIdentifier [

	^11
]

{ #category : 'resolving' }
RsrSetReference >> resolve: anRsrSession [

	| set |
	set := Set new: intermediate size * 2.
	intermediate do: [:each | set add: (each resolve: anRsrSession)].
	^set
]
