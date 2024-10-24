Class {
	#name : 'RsrRemoteError',
	#superclass : 'RsrError',
	#instVars : [
		'originalClassName',
		'stack'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrRemoteError class >> from: anException [

	| tag |
	tag := anException tag
		ifNotNil:
			[[anException tag asString]
				on: Error
				do: [:ex | ex return: 'Unable to pack #tag containing an instance of ', anException tag class name]].
	^self new
		originalClassName: anException class name;
		tag: tag;
		messageText: anException messageText;
		stack: RsrProcessModel currentStackDump;
		yourself
]

{ #category : 'accessing' }
RsrRemoteError >> originalClassName [

	^originalClassName
]

{ #category : 'accessing' }
RsrRemoteError >> originalClassName: aSymbol [

	originalClassName := aSymbol
]

{ #category : 'accessing' }
RsrRemoteError >> stack [

	^stack
]

{ #category : 'accessing' }
RsrRemoteError >> stack: aString [

	stack := aString
]
