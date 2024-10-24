Class {
	#name : 'RsrForwarderTest',
	#superclass : 'RsrTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'running' }
RsrForwarderTest >> testForwarding [
	"This test needs to be improved. It is out of sync."

	| service id connection forwarder sendMessage |
	service := RsrTestService clientClass new.
	id := 1.
	connection := RsrConnection
		channel: RsrNullChannel new
		transactionSpigot: RsrThreadSafeNumericSpigot naturals
		oidSpigot: RsrThreadSafeNumericSpigot naturals.
	connection open.
	service registerWith: connection.
	forwarder := service remoteSelf.
	forwarder
		arg1: 15
		arg2: 42.
	sendMessage := connection channel lastCommand.
	self
		assert: sendMessage transaction
		equals: 1.
	self
		assert: (sendMessage receiverReference resolve: connection)
		equals: service.
	self
		assert: (sendMessage selectorReference resolve: connection)
		equals: #arg1:arg2:.
	self
		assert: (sendMessage argumentReferences collect: [:each | each resolve: connection])
		equals: #(15 42).
]
