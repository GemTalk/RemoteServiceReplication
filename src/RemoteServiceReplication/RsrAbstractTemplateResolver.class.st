Class {
	#name : 'RsrAbstractTemplateResolver',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> clientClassForTemplate: aTemplate [

	^self
		clientClassForTemplate: aTemplate
		ifAbsent: [ RsrUnknownClass signal: aTemplate clientClassName ]
]

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> serverClassForTemplate: aTemplate [

	^self
		serverClassForTemplate: aTemplate
		ifAbsent: [ RsrUnknownClass signal: aTemplate serverClassName ]
]

{ #category : 'resolving' }
RsrAbstractTemplateResolver >> serverClassForTemplate: aTemplate
ifAbsent: absentBlock [

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
