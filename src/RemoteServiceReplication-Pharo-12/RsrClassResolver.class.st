Class {
	#name : 'RsrClassResolver',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-Pharo-12',
	#package : 'RemoteServiceReplication-Pharo-12'
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
