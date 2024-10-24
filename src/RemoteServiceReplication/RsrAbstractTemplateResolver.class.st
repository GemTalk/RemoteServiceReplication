Class {
	#name : 'RsrAbstractTemplateResolver',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> templateFor: aService [
	"Resolve the template associated with the provided Service."

	self subclassResponsibility
]

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> templateNamed: aTemplateName [
	"Resolve a template with the provided name."

	^self
		templateNamed: aTemplateName
		ifAbsent: [RsrUnknownTemplate signal: aTemplateName]
]

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> templateNamed: aTemplateName
ifAbsent: aBlock [
	"Resolve a template with the provided name."

	self flag: 'This should not send #templateClass. This can go away once ServiceSnapshot wire encoding is updated.'.
	^(RsrClassResolver classNamed: aTemplateName ifAbsent: aBlock) templateClass
]
