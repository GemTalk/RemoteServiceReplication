Class {
	#name : 'RsrClassResolver',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-Pharo-11'
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
