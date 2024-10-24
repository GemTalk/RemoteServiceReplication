Class {
	#name : 'RsrValueHolder',
	#superclass : 'RsrService',
	#instVars : [
		'value'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrValueHolder class >> clientClassName [

	^#RsrValueHolderClient
]

{ #category : 'accessing' }
RsrValueHolder class >> serverClassName [

	^#RsrValueHolderServer
]

{ #category : 'accessing' }
RsrValueHolder class >> templateClassName [

	^#RsrValueHolder
]

{ #category : 'instance creation' }
RsrValueHolder class >> value: anRsrObject [

	^self new
		value: anRsrObject;
		yourself
]

{ #category : 'accessing' }
RsrValueHolder >> value [

	^value
]

{ #category : 'accessing' }
RsrValueHolder >> value: anObject [

	value := anObject.
	self synchronize
]
