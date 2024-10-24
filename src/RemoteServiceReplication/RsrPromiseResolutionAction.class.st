Class {
	#name : 'RsrPromiseResolutionAction',
	#superclass : 'RsrObject',
	#instVars : [
		'when',
		'catch'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrPromiseResolutionAction class >> when: aWhenBlock
catch: aCatchBlock [

	^self new
		when: aWhenBlock;
		catch: aCatchBlock;
		yourself
]

{ #category : 'accessing' }
RsrPromiseResolutionAction >> catch [

	^catch
]

{ #category : 'accessing' }
RsrPromiseResolutionAction >> catch: aBlock [

	catch := aBlock
]

{ #category : 'accessing' }
RsrPromiseResolutionAction >> when [

	^when
]

{ #category : 'accessing' }
RsrPromiseResolutionAction >> when: aBlock [

	when := aBlock
]
