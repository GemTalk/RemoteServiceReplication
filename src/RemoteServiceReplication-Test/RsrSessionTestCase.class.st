Class {
	#name : 'RsrSessionTestCase',
	#superclass : 'RsrSystemTestCase',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'testing' }
RsrSessionTestCase class >> isAbstract [

	^self == RsrSessionTestCase
]

{ #category : 'running' }
RsrSessionTestCase >> testAllowExistingInstancesOfDeniedTemplate [

	| policy template allow value promise result |
	policy := RsrTestPolicy new.
	template := RsrServiceNoInstVars.
	rsrSessionB policy: policy.
	value := Time millisecondClockValue.

	"Send a new instance before Policy denies it."
	allow := template clientClass new.
	allow registerWith: rsrSessionA.
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
RsrSessionTestCase >> testPolicyRejection [

	| policy template allow reject value promise result reason |
	policy := RsrTestPolicy new.
	template := RsrServiceNoInstVars.
	rsrSessionB policy: policy.
	value := Time millisecondClockValue.

	"Send a new instance before Policy denies it."
	allow := template clientClass new.
	allow registerWith: rsrSessionA.
	promise := allow asyncSendReturnArgument: value.
	result := self expectWhen: promise.
	self
		assert: result
		equals: value.

	"Reject the template and try again with a new instance."
	policy deny: template.
	reject := template clientClass new.
	reject registerWith: rsrSessionA.
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
RsrSessionTestCase >> testPolicyRejectsFrameworkTemplate [

	| policy template service frameworkService promise result |
	policy := RsrTestPolicy new.
	template := RsrPolicyRejectedService.
	rsrSessionA policy: policy.
	rsrSessionB policy: policy.
	service := RsrServiceNoInstVars clientClass new.
	service registerWith: rsrSessionA.

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
RsrSessionTestCase >> testWaitUntilClose [

	| semaphore marker |
	semaphore := Semaphore new.
	marker := false.
	RsrProcessModel
		fork:
			[semaphore signal.
			[rsrSessionB waitUntilClose.
			marker := true]
				ensure: [semaphore signal]]
		named: 'Pending Connection Closure'.
	semaphore wait.
	self deny: marker.
	rsrSessionA close.
	semaphore wait.
	self assert: marker
]
