Class {
	#name : 'RsrInstruments',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-Pharo-11'
}

{ #category : 'instrumenting' }
RsrInstruments >> instrument: aBlock
label: aString [

	| time result |
	time := Time millisecondsToRun: [result := aBlock value].
	Transcript
		show: RsrDateAndTimeSpecies now printString, ': ', aString asString, ' took (', time asString, ') ms.';
		cr.
	^result
]

{ #category : 'instrumenting' }
RsrInstruments >> profile: aBlock
label: aString [

	| result |
	TimeProfiler onBlock: [result := aBlock value].
	^result
]

{ #category : 'instrumenting' }
RsrInstruments >> profile: aBlock
label: aString
if: aCondition [

	| result |
	aCondition
		ifTrue: [TimeProfiler onBlock: [result := aBlock value].]
		ifFalse: [result := aBlock value].
	^result
]
