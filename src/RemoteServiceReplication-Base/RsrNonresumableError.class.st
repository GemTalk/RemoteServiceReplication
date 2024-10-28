Class {
	#name : 'RsrNonresumableError',
	#superclass : 'RsrError',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'testing' }
RsrNonresumableError >> isResumable [

	^false
]
