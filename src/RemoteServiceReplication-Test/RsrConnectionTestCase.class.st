Class {
	#name : 'RsrConnectionTestCase',
	#superclass : 'RsrSystemTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'testing' }
RsrConnectionTestCase class >> isAbstract [

	^self == RsrConnectionTestCase
]

{ #category : 'running' }
RsrConnectionTestCase >> testAllowExistingInstancesOfDeniedTemplate [

	| policy template allow value promise result |
	policy := RsrTestPolicy new.
	template := RsrServiceNoInstVars.
	connectionB policy: policy.
	value := Time millisecondClockValue.

	"Send a new instance before Policy denies it."
	allow := template clientClass new.
	allow registerWith: connectionA.
	promise := allow asyncSendReturnArgument: value.
	result := self expectWhen: promise.
	self
		assert: result
		equals: value.

	"Reject the template and try again with the existing instance."
	policy deny: template.
	promise := allow asyncSendReturnArgument: value.
	result := self expectWhen: promise.
	self
		assert: result
		equals: value.
]

{ #category : 'running' }
RsrConnectionTestCase >> testPolicyRejection [

	| policy template allow reject value promise result reason |
	policy := RsrTestPolicy new.
	template := RsrServiceNoInstVars.
	connectionB policy: policy.
	value := Time millisecondClockValue.

	"Send a new instance before Policy denies it."
	allow := template clientClass new.
	allow registerWith: connectionA.
	promise := allow asyncSendReturnArgument: value.
	result := self expectWhen: promise.
	self
		assert: result
		equals: value.

	"Reject the template and try again with a new instance."
	policy deny: template.
	reject := template clientClass new.
	reject registerWith: connectionA.
	promise := reject asyncSendReturnArgument: value.
	reason := self expectCatch: promise.
	self
		assert: reason class
		equals: RsrPolicyRejectedServiceServer.
	self
		assert: reason templateName
		equals: template templateClassName.
	self
		assert: reason sid
		equals: reject _id
]

{ #category : 'running' }
RsrConnectionTestCase >> testPolicyRejectsFrameworkTemplate [

	| policy template service frameworkService promise result |
	policy := RsrTestPolicy new.
	template := RsrPolicyRejectedService.
	connectionA policy: policy.
	connectionB policy: policy.
	service := RsrServiceNoInstVars clientClass new.
	service registerWith: connectionA.

	"Send a new instance before Policy denies it."
	frameworkService := template clientClass new.
	promise := service asyncSendReturnArgument: frameworkService.
	result := self expectWhen: promise.
	self
		assert: result
		identicalTo: frameworkService.

	"Ensure it is allowed even if the Policy rejects it."
	policy deny: template.
	frameworkService := template clientClass new.
	promise := service asyncSendReturnArgument: frameworkService.
	result := self expectWhen: promise.
	self
		assert: result
		identicalTo: frameworkService.
]

{ #category : 'running' }
RsrConnectionTestCase >> testWaitUntilClose [

	| semaphore marker |
	semaphore := Semaphore new.
	marker := false.
	RsrProcessModel
		fork:
			[semaphore signal.
			[connectionB waitUntilClose.
			marker := true]
				ensure: [semaphore signal]]
		named: 'Pending Connection Closure'.
	semaphore wait.
	self deny: marker.
	connectionA close.
	semaphore wait.
	self assert: marker
]
