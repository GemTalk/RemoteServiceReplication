Class {
	#name : 'RsrNumericSpigot',
	#superclass : 'RsrObject',
	#instVars : [
		'stream'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrNumericSpigot class >> new [

	"Send #onInterval:, not #new"

	^ self shouldNotImplement
]

{ #category : 'instance creation' }
RsrNumericSpigot class >> onInterval: anInterval [

	^ super new initializeForInterval: anInterval
]

{ #category : 'initializing' }
RsrNumericSpigot >> initializeForInterval: anInterval [

	stream := ReadStream on: anInterval
]

{ #category : 'accessing' }
RsrNumericSpigot >> next [

	stream atEnd ifTrue: [ ^ RsrOutOfRange signal ].
	^ stream next
]

{ #category : 'accessing' }
RsrNumericSpigot >> next: aCount [

	| result |
	result := Array new: aCount.
	1 to: aCount do: [:i | result at: i put: self next].
	^result
]
