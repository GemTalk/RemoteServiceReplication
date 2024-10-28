Class {
	#name : 'RsrToken',
	#superclass : 'RsrTokenExchangeMessage',
	#instVars : [
		'bytes'
	],
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrToken class >> bytes: aByteArray [

	^self new
		bytes: aByteArray;
		yourself
]

{ #category : 'comparing' }
RsrToken >> = aToken [

	^self class == aToken class and: [self bytes = aToken bytes]
]

{ #category : 'accessing' }
RsrToken >> bytes [

	^bytes
]

{ #category : 'accessing' }
RsrToken >> bytes: aByteArray [

	bytes := aByteArray
]

{ #category : 'hashing' }
RsrToken >> hash [

	^self bytes hash
]
