Class {
	#name : 'RsrAbstractTemplateResolver',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> clientClassForTemplate: aTemplate [
	"Lookup the client class for the provided template."

	^self
		clientClassForTemplate: aTemplate
		ifAbsent: [ RsrUnknownClass signal: aTemplate clientClassName ]
]

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> clientClassForTemplate: aTemplate
ifAbsent: absentBlock [
	"Lookup the client class for the provided template."
	
	self subclassResponsibility
]

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> serverClassForTemplate: aTemplate [
	"Lookup the server class for the provided template."

	^self
		serverClassForTemplate: aTemplate
		ifAbsent: [ RsrUnknownClass signal: aTemplate serverClassName ]
]

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> serverClassForTemplate: aTemplate
ifAbsent: absentBlock [
	"Lookup the server class for the provided template."

	self subclassResponsibility
]

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> templateFor: aService [
	"Resolve the template associated with the provided Service."

	| template |
	template := aService class.
	[template isTemplateClass]
		whileFalse: [template := template superclass].
	^template
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

	self subclassResponsibility
]
