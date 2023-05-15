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

	^ (1 to: aCount) collect: [ :x | self next ]
]
