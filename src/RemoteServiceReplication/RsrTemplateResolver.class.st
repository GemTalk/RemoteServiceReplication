Class {
	#name : 'RsrTemplateResolver',
	#superclass : 'RsrAbstractTemplateResolver',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'resolving' }
RsrTemplateResolver >> clientClassForTemplate: aTemplate
ifAbsent: absentBlock [
	"Lookup the client class for the provided template."

	^RsrClassResolver
		classNamed: aTemplate clientClassName
		ifAbsent: absentBlock
]

{ #category : 'resolving' }
RsrTemplateResolver >> serverClassForTemplate: aTemplate
ifAbsent: absentBlock [
	"Lookup the server class for the provided template."

	^RsrClassResolver
		classNamed: aTemplate serverClassName
		ifAbsent: absentBlock
]

{ #category : 'resolving' }
RsrTemplateResolver >> templateNamed: aTemplateName
ifAbsent: aBlock [
	"Resolve a template with the provided name."

	^RsrClassResolver
		classNamed: aTemplateName
		ifAbsent: aBlock
]
