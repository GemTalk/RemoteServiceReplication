Class {
	#name : 'RsrMessagingCommand',
	#superclass : 'RsrCommand',
	#instVars : [
		'snapshots',
		'transaction'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'executing' }
RsrMessagingCommand >> reifyAllIn: anRsrSession [

	| servicesStrongly |
	"Must keep a strong reference to each service until we're sure a parent service is reified"
	servicesStrongly := snapshots collect: [ :each | 
		                    (each instanceIn: anRsrSession) preUpdate ].
	snapshots do: [ :each | each reifyIn: anRsrSession ].
	servicesStrongly do: [ :each | each postUpdate ].
	^ servicesStrongly "Sender must keep a strong reference until the root is anchored."
]

{ #category : 'accessing' }
RsrMessagingCommand >> snapshots [

	^snapshots
]

{ #category : 'accessing' }
RsrMessagingCommand >> snapshots: anArrayOfSnapshots [

	snapshots := anArrayOfSnapshots
]

{ #category : 'accessing' }
RsrMessagingCommand >> transaction [
	^ transaction
]

{ #category : 'accessing' }
RsrMessagingCommand >> transaction: anObject [
	transaction := anObject
]
