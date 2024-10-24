Class {
	#name : 'RsrLogWithPrefix',
	#superclass : 'RsrObject',
	#instVars : [
		'prefix',
		'log'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'logging' }
RsrLogWithPrefix class >> log: aLog [

	^self new
		log: aLog;
		yourself
]

{ #category : 'logging' }
RsrLogWithPrefix class >> prefix: aString
log: aLog [

	^self new
		prefix: aString;
		log: aLog;
		yourself
]

{ #category : 'debugging' }
RsrLogWithPrefix >> debug: aString [

	^self log debug: self prefix, '/', aString
]

{ #category : 'accessing' }
RsrLogWithPrefix >> log [

	^log
]

{ #category : 'accessing' }
RsrLogWithPrefix >> log: aLog [

	log := aLog
]

{ #category : 'accessing' }
RsrLogWithPrefix >> prefix [

	^prefix
]

{ #category : 'accessing' }
RsrLogWithPrefix >> prefix: aString [

	prefix := aString
]
