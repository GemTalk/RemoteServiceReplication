Class {
	#name : 'RsrStream',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'testing' }
RsrStream >> atEnd [
	"Answers when the Stream cannot take or provide any additional bytes."

	^self subclassResponsibility
]

{ #category : 'closing' }
RsrStream >> close [
	"Close the Stream. The semantics of this are defined by the subclass."

	self subclassResponsibility
]

{ #category : 'writing' }
RsrStream >> flush [
	"Ensure any data cached by the receiver is pushed to its destination."
	"By default, do nothing."
]

{ #category : 'reading' }
RsrStream >> next [
	"Read and return exactly 1 byte."

	^self next: 1
]

{ #category : 'reading' }
RsrStream >> next: count [
	"Read and return exactly <count> bytes"

	^self subclassResponsibility
]

{ #category : 'writing' }
RsrStream >> nextPutAll: aByteArray [
	"Write <aByteArray>'s elements to the backing store."

	^self subclassResponsibility
]
