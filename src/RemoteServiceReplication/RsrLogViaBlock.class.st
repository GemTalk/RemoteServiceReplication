Class {
	#name : 'RsrLogViaBlock',
	#superclass : 'RsrLogDestination',
	#instVars : [
		'action'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrLogViaBlock class >> action: aBlock [

	^self new
		action: aBlock;
		yourself
]

{ #category : 'accessing' }
RsrLogViaBlock >> action [

	^action
]

{ #category : 'accessing' }
RsrLogViaBlock >> action: aBlock [

	action := aBlock
]

{ #category : 'writing' }
RsrLogViaBlock >> write: aMessage [

	self action value: aMessage
]
