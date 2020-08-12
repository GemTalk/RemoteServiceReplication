Class {
	#name : 'RsrDateAndTimeInterface',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-GemStone'
}

{ #category : 'accessing' }
RsrDateAndTimeInterface class >> dateAndTimeClass [

	^DateAndTime
]

{ #category : 'accessing' }
RsrDateAndTimeInterface class >> fromString: aString [

	^self dateAndTimeClass fromString: aString
]