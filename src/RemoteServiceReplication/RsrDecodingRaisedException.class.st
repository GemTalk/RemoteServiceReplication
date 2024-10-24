Class {
	#name : 'RsrDecodingRaisedException',
	#superclass : 'RsrAbstractReason',
	#instVars : [
		'exception'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrDecodingRaisedException class >> exception: anException [

	^self new
		exception: anException;
		yourself
]

{ #category : 'accessing' }
RsrDecodingRaisedException >> exception [

	^exception
]

{ #category : 'accessing' }
RsrDecodingRaisedException >> exception: anException [

	exception := anException
]
