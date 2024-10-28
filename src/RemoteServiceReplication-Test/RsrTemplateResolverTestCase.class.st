Class {
	#name : 'RsrTemplateResolverTestCase',
	#superclass : 'RsrTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrTemplateResolverTestCase >> resolver [

	^RsrTemplateResolver new
]

{ #category : 'running' }
RsrTemplateResolverTestCase >> testClientClassForTemplate [

	| result |
	result := self resolver clientClassForTemplate: RsrNoServerService.
	self
		assert: result
		equals: RsrNoServerServiceClient.
	self
		should: [ self resolver clientClassForTemplate: RsrNoClientService ]
		raise: RsrUnknownClass
]

{ #category : 'running' }
RsrTemplateResolverTestCase >> testClientClassForTemplateIfAbsent [

	| marker result |
	marker := Object new.
	result := self resolver
		clientClassForTemplate: RsrNoServerService
		ifAbsent: [ marker ].
	self
		assert: result
		equals: RsrNoServerServiceClient.
	result := self resolver
		clientClassForTemplate: RsrNoClientService
		ifAbsent: [ marker ].
	self
		assert: result
		equals: marker
]

{ #category : 'running' }
RsrTemplateResolverTestCase >> testServerClassForTemplate [

	| result |
	result := self resolver serverClassForTemplate: RsrNoClientService.
	self
		assert: result
		equals: RsrNoClientServiceServer.
	self
		should: [ self resolver serverClassForTemplate: RsrNoServerService ]
		raise: RsrUnknownClass
]

{ #category : 'running' }
RsrTemplateResolverTestCase >> testServerClassForTemplateIfAbsent [

	| marker result |
	marker := Object new.
	result := self resolver
		serverClassForTemplate: RsrNoClientService
		ifAbsent: [ marker ].
	self
		assert: result
		equals: RsrNoClientServiceServer.
	result := self resolver
		serverClassForTemplate: RsrNoServerService
		ifAbsent: [ marker ].
	self
		assert: result
		equals: marker
]

{ #category : 'running' }
RsrTemplateResolverTestCase >> testTemplateFor [

	| service template |
	service := RsrRemoteActionClient new.
	template := self resolver templateFor: service.
	self
		assert: template
		identicalTo: RsrRemoteAction.
	service := RsrRemoteActionServer new.
	template := self resolver templateFor: service.
	self
		assert: template
		identicalTo: RsrRemoteAction
]

{ #category : 'running' }
RsrTemplateResolverTestCase >> testTemplateNamed [

	| template |
	template := self resolver templateNamed: #RsrRemoteAction.
	self
		assert: template
		identicalTo: RsrRemoteAction.
	self
		should: [self resolver templateNamed: #DoNotCreateThisClass]
		raise: RsrUnknownTemplate
]

{ #category : 'running' }
RsrTemplateResolverTestCase >> testTemplateNamedIfAbsent [

	| marker template |
	marker := Object new.
	template := self resolver
		templateNamed: #RsrRemoteAction
		ifAbsent: [marker].
	self
		assert: template
		identicalTo: RsrRemoteAction.
	template := self resolver
		templateNamed: #DoNotCreateThisClass
		ifAbsent: [marker].
	self
		assert: template
		identicalTo: marker
]
