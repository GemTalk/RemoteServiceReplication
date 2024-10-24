Class {
	#name : 'RsrGarbageCollector',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-Pharo-11'
}

{ #category : 'cleaning' }
RsrGarbageCollector class >> maximumReclamation [

	| obj sema |
	obj := Object new.
	sema := Semaphore new.
	obj
		toFinalizeSend: #cull:
		to: [sema signal]
		with: nil.
	obj := nil.
	Smalltalk garbageCollect.
	Processor yield.
	^(sema waitTimeoutMSecs: 10) not
]
