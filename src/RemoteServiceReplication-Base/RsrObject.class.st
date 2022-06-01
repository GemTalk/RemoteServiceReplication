Class {
	#name : 'RsrObject',
	#superclass : 'Object',
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'tracing' }
RsrObject class >> trace [

	Transcript
		show: RsrProcessModel currentStackDump;
		cr;
		cr
]

{ #category : 'notes' }
RsrObject >> flag: aSymbol [

	"Send this message, with a relevant symbol as argument, to flag a message for subsequent retrieval.  For example, you might put the following line in a number of messages:
	self flag: #returnHereUrgently
	Then, to retrieve all such messages, browse all senders of #returnHereUrgently."
]

{ #category : 'delaying' }
RsrObject >> minimalWait [
	"Ensure the calling process is not schedulable for a short period of time."

	(Delay forMilliseconds: 1) wait
]

{ #category : 'notes' }
RsrObject >> note: aString [
	"This method can be used to leave a note in code. For instance, a code path that needs to be tested."
]

{ #category : 'tracing' }
RsrObject >> trace [

	Transcript
		show: RsrProcessModel currentStackDump;
		cr;
		cr
]
