Class {
	#name : 'RsrTestPolicy',
	#superclass : 'RsrAbstractPolicy',
	#instVars : [
		'deniedTemplates'
	],
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrTestPolicy >> deny: aTemplate [

	deniedTemplates add: aTemplate
]

{ #category : 'initialization' }
RsrTestPolicy >> initialize [

	super initialize.
	deniedTemplates := Set new
]

{ #category : 'testing' }
RsrTestPolicy >> permits: aTemplate [
	"Permit any Template that hasn't been denied"

	^(deniedTemplates includes: aTemplate) not
]
