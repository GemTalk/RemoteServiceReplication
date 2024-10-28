Class {
	#name : 'RsrTemplateResolverWithClassVersions',
	#superclass : 'RsrTestCase',
	#category : 'RemoteServiceReplication-GemStone-Test'
}

{ #category : 'accessing' }
RsrTemplateResolverWithClassVersions >> resolver [

	^RsrTemplateResolver new
]

{ #category : 'cleanup' }
RsrTemplateResolverWithClassVersions >> tearDown [

	RsrService
		rwSubclass: 'RsrVersionService'
		instVarNames: #()
		classVars: #()
		classInstVars: #()
		poolDictionaries: #()
		category: 'RemoteServiceReplication-GemStone-Test'
		options: #().
	super tearDown
]

{ #category : 'running' }
RsrTemplateResolverWithClassVersions >> testVersionClassAfterCreatingService [

	| template service result |
	template := RsrVersionService.
	service := RsrVersionServiceClient new.
	result := self resolver templateFor: service.
	self
		assert: result
		identicalTo: template.
	"Revision the Service class and Template"
	RsrService
		rwSubclass: 'RsrVersionService'
		instVarNames: {'a', Time millisecondClockValue printString}
		classVars: #()
		classInstVars: #()
		poolDictionaries: #()
		category: 'RemoteServiceReplication-GemStone-Test'
		options: #().
	result := self resolver templateFor: service.
	self
		assert: result
		identicalTo: template.
	self
		deny: result
		identicalTo: RsrVersionService.
	result := self resolver templateFor: RsrVersionServiceClient new.
	self
		assert: result
		identicalTo: RsrVersionService
]
