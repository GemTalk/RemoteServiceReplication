Class {
	#name : 'RsrThreadSafeNumericSpigot',
	#superclass : 'RsrNumericSpigot',
	#instVars : [
		'mutex'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'initialization' }
RsrThreadSafeNumericSpigot >> initialize [

	super initialize.
	mutex := Semaphore forMutualExclusion
]

{ #category : 'accessing' }
RsrThreadSafeNumericSpigot >> next [

	^mutex critical: [super next]
]
