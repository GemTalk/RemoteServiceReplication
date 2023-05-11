"
A transport that connects two object channels within the same Smalltalk VM by use of a pair of shared queues.
"
Class {
	#name : 'RsrSharedQueueTransport',
	#superclass : 'RsrInternalTransport',
	#category : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrSharedQueueTransport class >> buildPairFrom: aTransportTemplate [

	| queueA queueB transportA transportB |
	queueA := SharedQueue new.
	queueB := SharedQueue new.

	transportA := self new
		              readStream: queueA;
		              writeStream: queueB;
		              template: aTransportTemplate;
		              yourself.

	transportB := self new
		              readStream: queueB;
		              writeStream: queueA;
		              template: aTransportTemplate;
		              yourself.
	^ { 
		  transportA.
		  transportB }
]

{ #category : 'initialization' }
RsrSharedQueueTransport >> initialize [

	super initialize.
	description := RsrSharedQueueTransportDescription new
]

{ #category : 'testing' }
RsrSharedQueueTransport >> isOpen [

	^ readStream notNil & writeStream notNil
]

{ #category : 'operations' }
RsrSharedQueueTransport >> open [

	"Nothing to do"
]
