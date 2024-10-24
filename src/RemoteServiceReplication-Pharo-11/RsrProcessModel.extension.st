Extension { #name : 'RsrProcessModel' }

{ #category : '*RemoteServiceReplication-Pharo-11' }
RsrProcessModel >> configureUnhandleExceptionProtection [
	"There is not special configuration necessary to ensure an appropriate UnhandledException hook."

	^nil
]

{ #category : '*RemoteServiceReplication-Pharo-11' }
RsrProcessModel class >> current [

	^current ifNil: [self resetCurrent]
]

{ #category : '*RemoteServiceReplication-Pharo-11' }
RsrProcessModel class >> current: concurrency [

	current := concurrency
]

{ #category : '*RemoteServiceReplication-Pharo-11' }
RsrProcessModel >> currentStackDump [

	| stream context |
	stream := WriteStream on: (String new: 128).
	context := thisContext.
	[context isNil]
		whileFalse:
			[stream
				print: context;
				lf.
			context := context sender].
	^stream contents
]

{ #category : '*RemoteServiceReplication-Pharo-11' }
RsrProcessModel class >> resetCurrent [

	^current := self new
]

{ #category : '*RemoteServiceReplication-Pharo-11' }
RsrProcessModel class >> unhandledExceptionClass [
	"Returns the Pharo UnhandledError class since this will be signaled automatically by the Exception mechanism. We don't need to use RsrUnhandledException."

	^UnhandledError
]
