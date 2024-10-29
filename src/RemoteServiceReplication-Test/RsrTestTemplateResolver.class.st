Class {
	#name : 'RsrTestTemplateResolver',
	#superclass : 'RsrAbstractTemplateResolver',
	#instVars : [
		'templates'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'adding' }
RsrTestTemplateResolver >> addTemplate: aTemplate [

	^templates add: aTemplate
]

{ #category : 'resolving' }
RsrTestTemplateResolver >> clientClassForTemplate: aTemplate
ifAbsent: absentBlock [
	"Lookup the client class for the provided template."

	| clientClassName |
	clientClassName := aTemplate clientClassName.
	templates do: [:template | template allSubclasses do: [:sc | sc name == clientClassName ifTrue: [^sc]]].
	^absentBlock value
]

{ #category : 'initializing' }
RsrTestTemplateResolver >> initialize [

	super initialize.
	templates := OrderedCollection new
]

{ #category : 'resolving' }
RsrTestTemplateResolver >> serverClassForTemplate: aTemplate
ifAbsent: absentBlock [
	"Lookup the server class for the provided template."

	| serverClassName |
	serverClassName := aTemplate serverClassName.
	templates do: [:template | template allSubclasses do: [:sc | sc name == serverClassName ifTrue: [^sc]]].
	^absentBlock value
]

{ #category : 'resolving' }
RsrTestTemplateResolver >> templateNamed: aTemplateName
ifAbsent: aBlock [
	"Resolve a template with the provided name."

	^templates
		detect: [:template | template name == aTemplateName]
		ifNone: aBlock
]
