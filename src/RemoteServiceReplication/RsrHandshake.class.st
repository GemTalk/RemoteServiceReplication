Class {
	#name : 'RsrHandshake',
	#superclass : 'RsrObject',
	#instVars : [
		'steps',
		'stream',
		'wireProtocol'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrHandshake class >> steps: anArrayOfSteps
stream: aStream [

	^self new
		steps: anArrayOfSteps;
		stream: aStream;
		yourself
]

{ #category : 'performing' }
RsrHandshake >> perform [
	"Perform the sequence of configured steps."

	self steps do: [:each | each performFor: self over: self stream]
]

{ #category : 'accessing' }
RsrHandshake >> steps [
	"The sequence of handshake steps to perform."

	^steps
]

{ #category : 'accessing' }
RsrHandshake >> steps: anArrayOfSteps [
	"The sequence of handshake steps to perform."

	steps := anArrayOfSteps
]

{ #category : 'accessing' }
RsrHandshake >> stream [
	"The stream used by each step."

	^stream
]

{ #category : 'accessing' }
RsrHandshake >> stream: aStream [
	"The stream used by each step."

	stream := aStream
]

{ #category : 'accessing' }
RsrHandshake >> wireProtocol [
	"Returns the chosen wire protocol.
	nil - if no protocol negotiation happened."

	^wireProtocol
]

{ #category : 'accessing' }
RsrHandshake >> wireProtocol: aWireProtocol [
	"Sets the chosen wire protocol."

	wireProtocol := aWireProtocol
]
