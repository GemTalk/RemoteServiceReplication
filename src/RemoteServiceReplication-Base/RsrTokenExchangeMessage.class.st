Class {
	#name : 'RsrTokenExchangeMessage',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'comparing' }
RsrTokenExchangeMessage >> = aTokenExchangeMessage [

	^self class == aTokenExchangeMessage class
]

{ #category : 'hashing' }
RsrTokenExchangeMessage >> hash [

	^self class hash
]
