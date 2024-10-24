Class {
	#name : 'RsrNumericSpigot',
	#superclass : 'RsrObject',
	#instVars : [
		'current',
		'step'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrNumericSpigot class >> naturals [

	^self
		start: 1
		step: 1
]

{ #category : 'instance creation' }
RsrNumericSpigot class >> new [

	^self
		start: 0
		step: 1
]

{ #category : 'instance creation' }
RsrNumericSpigot class >> start: aNumber
step: anIncrement [

	^super new
		start: aNumber;
		step: anIncrement;
		yourself
]

{ #category : 'accessing' }
RsrNumericSpigot >> negated [

	^self class
		start: current negated
		step: step negated
]

{ #category : 'accessing' }
RsrNumericSpigot >> next [

	| result |
	result := current.
	current := current + step.
	^result
]

{ #category : 'accessing' }
RsrNumericSpigot >> next: aCount [

	| result |
	result := Array new: aCount.
	1 to: aCount do: [:i | result at: i put: self next].
	^result
]

{ #category : 'accessing' }
RsrNumericSpigot >> start: aNumber [

	current := aNumber
]

{ #category : 'accessing' }
RsrNumericSpigot >> step [

	^step
]

{ #category : 'accessing' }
RsrNumericSpigot >> step: anIncrement [

	step := anIncrement
]
