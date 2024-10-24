Class {
	#name : 'RsrTemplateResolver',
	#superclass : 'RsrAbstractTemplateResolver',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'resolving' }
RsrTemplateResolver >> templateFor: aService [
	"Resolve the template associated with the provided Service."

	| template |
	template := aService class.
	[template isTemplateClass]
		whileFalse: [template := template superclass].
	^template
]

{ #category : 'resolving' }
RsrTemplateResolver >> templateNamed: aTemplateName
ifAbsent: aBlock [
	"Resolve a template with the provided name."

	self flag: 'This should not send #templateClass. This can go away once ServiceSnapshot wire encoding is updated.'.
	^(RsrClassResolver classNamed: aTemplateName ifAbsent: [^aBlock value]) templateClass
]
