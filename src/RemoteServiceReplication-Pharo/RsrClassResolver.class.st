Class {
	#name : 'RsrClassResolver',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-Pharo',
	#package : 'RemoteServiceReplication-Pharo'
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
