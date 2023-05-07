"
No class-specific documentation for RsrValueReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)

"
Class {
	#name : 'RsrValueReference',
	#superclass : 'RsrImmediateReference',
	#instVars : [
		'intermediate'
	],
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrValueReference class >> intermediate: anObject [

	^self new
		intermediate: anObject;
		yourself
]

{ #category : 'private-accessing' }
RsrValueReference >> intermediate: anObject [
	"Store the intermediate form of this object"

	intermediate := anObject
]

{ #category : 'resolving' }
RsrValueReference >> resolve: anRsrSession [

	^intermediate
]
