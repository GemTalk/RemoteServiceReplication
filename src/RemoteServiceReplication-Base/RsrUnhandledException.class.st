"
This class is used in GemStone and Dolphin to help process unhandled exceptions. Pharo will used the native UnhandledError class.

This should not be signaled outside of the framework.
"
Class {
	#name : 'RsrUnhandledException',
	#superclass : 'Exception',
	#instVars : [
		'exception'
	],
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'signaling' }
RsrUnhandledException class >> signal: anException [
	"Signal the exception in reference to the provided exception."

	^self new
		exception: anException;
		signal
]

{ #category : 'acccessing' }
RsrUnhandledException >> exception [
	"The exception that was unhandled."

	^exception
]

{ #category : 'acccessing' }
RsrUnhandledException >> exception: anException [
	"The exception that was unhandled."

	exception := anException
]
