Class {
	#name : 'RsrHandshakeStep',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication'
}

{ #category : 'private' }
RsrHandshakeStep class >> classForChannel: aChannel [

	^ self subclassResponsibility
]

{ #category : 'instance creation' }
RsrHandshakeStep class >> forChannel: aChannel [

	^ (self classForChannel: aChannel) new
]

{ #category : 'performing' }
RsrHandshakeStep >> performForChannel: aChannel [

	"Perform the work for this step."

	^ self subclassResponsibility
]
