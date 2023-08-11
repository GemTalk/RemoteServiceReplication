"
Builds a pair of Sessions in the same VM connected by a SharedQueue communicating via Command objects.

There are no configuration messages for this kind of builder.
"
Class {
	#name : 'RsrSharedQueueSessionPairBuilder',
	#superclass : 'RsrInternalSessionPairBuilder',
	#category : 'RemoteServiceReplication'
}

{ #category : 'building' }
RsrSharedQueueSessionPairBuilder >> buildPair [

	"Answer a pair of peer Sessions within this VM"

	| queueA queueB transportA transportB |
	queueA := SharedQueue new.
	queueB := SharedQueue new.

	transportA := RsrSharedQueueTransport
		              readStream: queueA
		              writeStream: queueB.

	transportB := RsrSharedQueueTransport
		              readStream: queueB
		              writeStream: queueA.

	^ { 
		  transportA.
		  transportB } collect: [ :each | 
		  self buildSessionForTransport: each ]
]
