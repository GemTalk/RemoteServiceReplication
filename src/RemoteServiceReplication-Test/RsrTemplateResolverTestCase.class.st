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
