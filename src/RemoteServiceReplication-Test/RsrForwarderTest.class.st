Class {
	#name : 'RsrForwarderTest',
	#superclass : 'RsrTestCase',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrForwarderTest >> testForwarding [

	"This test needs to be improved. It is out of sync."

	| service id rsrSession forwarder sendMessage |
	service := RsrTestService clientClass new.
	id := 1.
	rsrSession := RsrNullChannel new openRsrSession.
	service registerWith: rsrSession.
	forwarder := service remoteSelf.
	forwarder arg1: 15 arg2: 42.
	sendMessage := rsrSession channel lastCommand.
	self assert: sendMessage transaction equals: 1.
	self
		assert: (sendMessage receiverReference resolve: rsrSession)
		equals: service.
	self
		assert: (sendMessage selectorReference resolve: rsrSession)
		equals: #arg1:arg2:.
	self
		assert: (sendMessage argumentReferences collect: [ :each | 
				 each resolve: rsrSession ])
		equals: #( 15 42 )
]
