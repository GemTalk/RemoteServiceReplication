"
I maintain the associations between locally stored objects and their remote counterparts.
"
Class {
	#name : 'RsrThreadSafeDictionary',
	#superclass : 'RsrObject',
	#instVars : [
		'mutex',
		'map'
	],
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'accessing' }
RsrThreadSafeDictionary >> at: aKey
ifAbsent: aBlock [

	| isPresent result |
	isPresent := true.
	result := self critical: [map at: aKey ifAbsent: [isPresent := false]].
	^isPresent
		ifTrue: [result]
		ifFalse: [aBlock value]
]

{ #category : 'accessing' }
RsrThreadSafeDictionary >> at: aKey
put: aValue [

	self critical: [map at: aKey put: aValue].
	^aValue
]

{ #category : 'utilities' }
RsrThreadSafeDictionary >> critical: aBlock [

	^mutex critical: aBlock
]

{ #category : 'enumerating' }
RsrThreadSafeDictionary >> do: aBlock [

	| values |
	values := self critical: [map values].
	values do: aBlock
]

{ #category : 'initialization' }
RsrThreadSafeDictionary >> initialize [

	super initialize.
	mutex := Semaphore forMutualExclusion.
	map := Dictionary new
]

{ #category : 'removing' }
RsrThreadSafeDictionary >> removeKey: anRsrId [

	^self critical: [map removeKey: anRsrId ifAbsent: [nil]]
]

{ #category : 'removing' }
RsrThreadSafeDictionary >> removeKey: anRsrId
ifAbsent: aBlock [

	| element wasRemoved |
	wasRemoved := true.
	element := self critical: [map removeKey: anRsrId ifAbsent: [wasRemoved := false]].
	^wasRemoved
		ifTrue: [element]
		ifFalse: [aBlock value]
]
