Class {
	#name : 'RsrClassResolver',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-Pharo-13',
	#package : 'RemoteServiceReplication-Pharo-13'
}

{ #category : 'accessing' }
RsrClassResolver class >> classNamed: aSymbol [

	^Smalltalk at: aSymbol ifAbsent: [RsrUnknownClass signal: aSymbol]
]

{ #category : 'accessing' }
RsrClassResolver class >> classNamed: aSymbol
ifAbsent: aBlock [

	^Smalltalk at: aSymbol ifAbsent: aBlock
]
