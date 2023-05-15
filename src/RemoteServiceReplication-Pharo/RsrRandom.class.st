"
Access to Pharo's less-than-stellar random number generator
"
Class {
	#name : 'RsrRandom',
	#superclass : 'RsrObject',
	#instVars : [
		'nativeSocket'
	],
	#category : 'RemoteServiceReplication-Pharo'
}

{ #category : 'utility' }
RsrRandom class >> random60 [

	"Answer a 60-bit non-negative random number"

	"Pharo's Random generator produces at most 32 bits of randomness at a time, so take the high-order 20 bits of three
	numbers"

	| result |
	result := 0.
	3 timesRepeat: [ 
		result := (result bitShift: 20) + 16r100000 atRandom - 1 ].
	^ result
]
