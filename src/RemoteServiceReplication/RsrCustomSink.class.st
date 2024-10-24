Class {
	#name : 'RsrCustomSink',
	#superclass : 'RsrLogSink',
	#instVars : [
		'action'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrCustomSink class >> action: aBlock [

	^self new
		action: aBlock;
		yourself
]

{ #category : 'accessing' }
RsrCustomSink >> action [

	^action
]

{ #category : 'accessing' }
RsrCustomSink >> action: aBlock [

	action := aBlock
]

{ #category : 'writing' }
RsrCustomSink >> write: aMessage [

	self action value: aMessage
]
