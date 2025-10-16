Class {
	#name : 'RsrGarbageCollector',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-Pharo-13',
	#package : 'RemoteServiceReplication-Pharo-13'
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
	^(sema waitTimeoutMilliseconds: 10) not
]
