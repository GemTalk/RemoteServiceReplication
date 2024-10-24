Class {
	#name : 'RsrMessageSend',
	#superclass : 'RsrObject',
	#instVars : [
		'receiver',
		'selector',
		'arguments'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrMessageSend class >> receiver: anObject
selector: aSelector
arguments: anArray [

	^self new
		receiver: anObject;
		selector: aSelector;
		arguments: anArray;
		yourself
]

{ #category : 'accessing' }
RsrMessageSend >> arguments [

	^arguments
]

{ #category : 'accessing' }
RsrMessageSend >> arguments: anArray [

	arguments := anArray
]

{ #category : 'evaluating' }
RsrMessageSend >> perform [

	^self receiver
		perform: self selector
		withArguments: self arguments
]

{ #category : 'accessing' }
RsrMessageSend >> receiver [

	^receiver
]

{ #category : 'accessing' }
RsrMessageSend >> receiver: anObject [

	receiver := anObject
]

{ #category : 'accessing' }
RsrMessageSend >> selector [

	^selector
]

{ #category : 'accessing' }
RsrMessageSend >> selector: aSelector [

	selector := aSelector
]
