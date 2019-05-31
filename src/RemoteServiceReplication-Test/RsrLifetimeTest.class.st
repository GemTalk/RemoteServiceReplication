Class {
	#name : #RsrLifetimeTest,
	#superclass : #RsrSystemTestCase,
	#category : #'RemoteServiceReplication-Test-TestCases'
}

{ #category : #running }
RsrLifetimeTest >> testCloseWithDanglingObject [
	"It is possible that the connection could disconnect between when an object
	is received and when the upcoming SendMessage or DeliverResponse message is received.
	If this is the case, we coul leak memory due to the caching used to ensure
	the object is stored in memory long enough to process the upcoming message.
	Test to ensure the object is freed on the connection close."

	| service command |
	self maximumReclamation.
	self assert: RsrClientNoInstVars allInstances isEmpty.
	service := RsrServerNoInstVars new.
	service
		rsrId: 2;
		rsrConnection: connectionA.
	command := RsrRetainObject object: service.
	command
		encodeUsing: connectionA encoder;
		writeUsing: connectionA commandWriter.
	connectionA commandWriter flush.
	(Delay forSeconds: 1) wait.
	connectionA close.
	connectionB close.
	service := command := nil.
	self maximumReclamation.
	self assert: RsrClientNoInstVars allInstances isEmpty
]

{ #category : #running }
RsrLifetimeTest >> testRemoteReferenceLifetime [

	| name valueServiceLocal valueServiceRemote serviceLocal serviceRemote id marker actual |
	name := 'ValueService'.
	serviceLocal := RsrClientNoInstVars new.
	valueServiceLocal := RsrValueHolderClient value: serviceLocal.
	self sharedNamespaceA
		at: name
		put: valueServiceLocal.
	valueServiceRemote := self sharedNamespaceB at: name.
	serviceRemote := valueServiceRemote value.
	id := serviceLocal rsrId.
	self
		assert: serviceRemote class
		equals: RsrServerNoInstVars.
	serviceLocal := serviceRemote := nil.
	valueServiceRemote value: nil.
	self maximumReclamation.
	(Delay forSeconds: 2) wait.
	Smalltalk at: #KeepItAlive put: (Array with: connectionA with: connectionB).
	marker := Object new.
	actual := connectionA registry at: id ifAbsent: [marker].
	self
		assert: actual
		equals: marker.
	actual := connectionB registry at: id ifAbsent: [marker].
	self
		assert: actual
		equals: marker
]