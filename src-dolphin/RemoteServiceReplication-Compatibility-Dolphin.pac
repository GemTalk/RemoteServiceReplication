﻿| package |
package := Package name: 'RemoteServiceReplication-Compatibility-Dolphin'.
package paxVersion: 1;
	basicComment: ''.


package classNames
	add: #RsrAbstractService;
	add: #RsrClassResolver;
	add: #RsrEnvironment;
	add: #RsrForwarder;
	add: #RsrGarbageCollector;
	add: #RsrObject;
	add: #RsrProtoObject;
	add: #RsrRegistry;
	add: #RsrRegistryElement;
	add: #RsrScientist;
	add: #RsrSocket;
	add: #RsrWeakRegistryElement;
	yourself.

package methodNames
	add: #SequenceableCollection -> #doWithIndex:;
	add: #Set -> #hash;
	add: 'RsrCharacterArraySpecies class' -> #fromBytes:;
	add: 'RsrCharacterArraySpecies class' -> #toBytes:;
	add: 'RsrDateAndTimeSpecies class' -> #fromMicroseconds:;
	add: 'RsrDateAndTimeSpecies class' -> #microsecondsSinceEpoch:;
	add: 'RsrDateAndTimeSpecies class' -> #now;
	add: 'RsrDateAndTimeSpecies class' -> #posixEpoch;
	add: 'RsrSpecies class' -> #initializeSpeciesMapping;
	yourself.

package binaryGlobalNames: (Set new
	yourself).

package globalAliases: (Set new
	yourself).

package setPrerequisites: #('RemoteServiceReplication-Base').

package!

"Class Definitions"!

Object subclass: #RsrObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrObject subclass: #RsrAbstractService
	instanceVariableNames: 'finalizationSend'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrObject subclass: #RsrClassResolver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrObject subclass: #RsrEnvironment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrObject subclass: #RsrGarbageCollector
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrObject subclass: #RsrRegistry
	instanceVariableNames: 'mutex map reapAction'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrObject subclass: #RsrRegistryElement
	instanceVariableNames: 'storage'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrObject subclass: #RsrScientist
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrObject subclass: #RsrSocket
	instanceVariableNames: 'socket'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrRegistryElement subclass: #RsrWeakRegistryElement
	instanceVariableNames: 'finalizationSend'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ProtoObject subclass: #RsrProtoObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RsrProtoObject subclass: #RsrForwarder
	instanceVariableNames: '_service'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

"Global Aliases"!


"Loose Methods"!

!RsrCharacterArraySpecies class methodsFor!

fromBytes: aByteArray

	^Utf8String fromByteArray: aByteArray!

toBytes: aCharacterArray

	^aCharacterArray asUtf8String asByteArray! !
!RsrCharacterArraySpecies class categoriesFor: #fromBytes:!public! !
!RsrCharacterArraySpecies class categoriesFor: #toBytes:!public! !

!RsrDateAndTimeSpecies class methodsFor!

fromMicroseconds: anInteger

	^TimeStamp fromMilliseconds: self posixEpoch asMilliseconds + (anInteger // 1000)!

microsecondsSinceEpoch: aTimeStamp

	| millisDiff |
	millisDiff := aTimeStamp asMilliseconds - self posixEpoch asMilliseconds.
	^millisDiff * 1000!

now

	^TimeStamp current!

posixEpoch

	^TimeStamp fromSeconds: 2177452800! !
!RsrDateAndTimeSpecies class categoriesFor: #fromMicroseconds:!public! !
!RsrDateAndTimeSpecies class categoriesFor: #microsecondsSinceEpoch:!public! !
!RsrDateAndTimeSpecies class categoriesFor: #now!public! !
!RsrDateAndTimeSpecies class categoriesFor: #posixEpoch!public! !

!RsrSpecies class methodsFor!

initializeSpeciesMapping

	speciesMapping := Dictionary new.
	speciesMapping
		at: Symbol
		put: RsrSymbolSpecies.
	speciesMapping
		at: String
		put: RsrStringSpecies.
	speciesMapping
		at: Utf8String
		put: RsrStringSpecies.
	speciesMapping
		at: AnsiString
		put: RsrStringSpecies.
	speciesMapping
		at: LargeInteger
		put: RsrIntegerSpecies.
	speciesMapping
		at: SmallInteger
		put: RsrIntegerSpecies.
	speciesMapping
		at: Character
		put: RsrCharacterSpecies.
	speciesMapping
		at: UndefinedObject
		put: RsrUndefinedObjectSpecies.
	speciesMapping
		at: True
		put: RsrBooleanSpecies.
	speciesMapping
		at: False
		put: RsrBooleanSpecies.
	speciesMapping
		at: Array
		put: RsrArraySpecies.
	speciesMapping
		at: ByteArray
		put: RsrByteArraySpecies.
	speciesMapping
		at: Set
		put: RsrSetSpecies.
	speciesMapping
		at: OrderedCollection
		put: RsrOrderedCollectionSpecies.
	speciesMapping
		at: Dictionary
		put: RsrDictionarySpecies.
	speciesMapping
		at: TimeStamp
		put: RsrDateAndTimeSpecies.
	^speciesMapping! !
!RsrSpecies class categoriesFor: #initializeSpeciesMapping!public! !

!SequenceableCollection methodsFor!

doWithIndex: aBlock

	| index size |
	index := 1.
	size := self size.
	[index <= size]
		whileTrue:
			[aBlock
				value: (self at: index)
				value: index.
			index := index + 1]! !
!SequenceableCollection categoriesFor: #doWithIndex:!public! !

!Set methodsFor!

hash

	^self
		inject: #Set hash
		into: [:hash :each | hash bitXor: each hash]! !
!Set categoriesFor: #hash!public! !

"End of package definition"!

"Source Globals"!

"Classes"!

RsrObject guid: (GUID fromString: '{8faf60e5-9213-4b3a-b8ca-d6e46209c662}')!
RsrObject comment: ''!
!RsrObject categoriesForClass!RemoteServiceReplication-Compatibility-Dolphin! !
!RsrObject methodsFor!

initialize

	^self! !
!RsrObject categoriesFor: #initialize!public! !

!RsrObject class methodsFor!

new

	^super new initialize! !
!RsrObject class categoriesFor: #new!public! !

RsrAbstractService guid: (GUID fromString: '{7fe58ad6-2d95-4e01-9243-9cb9d5506477}')!
RsrAbstractService comment: ''!
!RsrAbstractService categoriesForClass!Unclassified! !
!RsrAbstractService methodsFor!

finalize

	finalizationSend value!

toFinalizeEvaluate: aMessageSend

	finalizationSend := aMessageSend.
	self beFinalizable! !
!RsrAbstractService categoriesFor: #finalize!public! !
!RsrAbstractService categoriesFor: #toFinalizeEvaluate:!public! !

RsrClassResolver guid: (GUID fromString: '{bcecf4c2-9299-4982-b23b-1f72cc6e0c96}')!
RsrClassResolver comment: ''!
!RsrClassResolver categoriesForClass!RemoteServiceReplication-Compatibility-Dolphin! !
!RsrClassResolver class methodsFor!

classNamed: aSymbol

	^self
		classNamed: aSymbol
		ifAbsent: [RsrUnknownClass signal: aSymbol]!

classNamed: aSymbol
ifAbsent: aBlock

	^Smalltalk
		at: aSymbol
		ifAbsent: aBlock! !
!RsrClassResolver class categoriesFor: #classNamed:!public! !
!RsrClassResolver class categoriesFor: #classNamed:ifAbsent:!public! !

RsrEnvironment guid: (GUID fromString: '{d34e5cc4-a2e0-49ec-8483-17b8faccc9f0}')!
RsrEnvironment comment: ''!
!RsrEnvironment categoriesForClass!RemoteServiceReplication-Compatibility-Dolphin! !
!RsrEnvironment class methodsFor!

ifPharo: p
ifGemStone: g
ifDolphin: aBlock

	^aBlock value! !
!RsrEnvironment class categoriesFor: #ifPharo:ifGemStone:ifDolphin:!public! !

RsrGarbageCollector guid: (GUID fromString: '{6b2d74f4-36e4-45a4-95c8-e886a1855d81}')!
RsrGarbageCollector comment: ''!
!RsrGarbageCollector categoriesForClass!RemoteServiceReplication-Compatibility-Dolphin! !
!RsrGarbageCollector class methodsFor!

invokeGarbageCollector

	MemoryManager current collectGarbage!

maximumReclamation

	| service element sema didFinalize action |
	service := RsrAbstractService new.
	sema := Semaphore new.
	didFinalize := false.
	action :=
		[didFinalize := true.
		sema signal].
	element := RsrWeakRegistryElement
		value: service
		toFinalizeEvaluate: action.
	service := nil.
	self invokeGarbageCollector.
	[(Delay forSeconds: 1) wait. "Wait up to one second for finalization"
	sema signal] fork.
	sema wait.
	^didFinalize! !
!RsrGarbageCollector class categoriesFor: #invokeGarbageCollector!public! !
!RsrGarbageCollector class categoriesFor: #maximumReclamation!public! !

RsrRegistry guid: (GUID fromString: '{5192e31f-c2f6-463e-b545-31a8190ee6be}')!
RsrRegistry comment: 'I maintain the associations between locally stored objects and their remote counterparts.'!
!RsrRegistry categoriesForClass!RemoteServiceReplication-Compatibility-Dolphin! !
!RsrRegistry methodsFor!

at: aKey

	^self at: aKey ifAbsent: [Error signal: 'Unknown key: ', aKey asString]!

at: aKey
ifAbsent: aBlock

	| element |
	element := mutex critical: [map at: aKey ifAbsent: []].
	^self
		elementValue: element
		ifNil: aBlock!

at: aKey
put: aService
	"Store aService into the registry"

	| element |
	element := aService isServer
		ifTrue: [RsrRegistryElement value: aService]
		ifFalse:
			[| finalizeSend |
			finalizeSend := MessageSend
				receiver: self
				selector: #reap:
				argument: aKey.
			RsrWeakRegistryElement
				value: aService
				toFinalizeEvaluate: finalizeSend].
	mutex critical: [map at: aKey put: element]!

elementValue: anElement
ifNil: aBlock

	| value |
	anElement isNil
		ifTrue: [^aBlock value].
	value := anElement value.
	^value == DeadObject current
		ifTrue: [aBlock value]
		ifFalse: [value]!

includesKey: aKey

	^mutex critical: [map includesKey: aKey]!

initialize

	super initialize.
	map := Dictionary new.
	mutex := Semaphore forMutualExclusion!

reap: aKey

	self removeKey: aKey.
	self reapAction value: aKey!

reapAction

	^reapAction!

reapAction: aBlock

	reapAction := aBlock!

removeKey: aKey

	| element value |
	element := mutex critical: [map removeKey: aKey ifAbsent: [nil]].
	^self
		elementValue: element
		ifNil: [nil]! !
!RsrRegistry categoriesFor: #at:!public! !
!RsrRegistry categoriesFor: #at:ifAbsent:!public! !
!RsrRegistry categoriesFor: #at:put:!public! !
!RsrRegistry categoriesFor: #elementValue:ifNil:!public! !
!RsrRegistry categoriesFor: #includesKey:!public! !
!RsrRegistry categoriesFor: #initialize!public! !
!RsrRegistry categoriesFor: #reap:!public! !
!RsrRegistry categoriesFor: #reapAction!public! !
!RsrRegistry categoriesFor: #reapAction:!public! !
!RsrRegistry categoriesFor: #removeKey:!public! !

!RsrRegistry class methodsFor!

new

	^self reapAction: [:key | ]!

reapAction: aBlock

	^super new
		reapAction: aBlock;
		yourself! !
!RsrRegistry class categoriesFor: #new!public! !
!RsrRegistry class categoriesFor: #reapAction:!public! !

RsrRegistryElement guid: (GUID fromString: '{636f9a23-234c-4a7a-ab6d-6d1700364857}')!
RsrRegistryElement comment: ''!
!RsrRegistryElement categoriesForClass!RemoteServiceReplication-Compatibility-Dolphin! !
!RsrRegistryElement methodsFor!

initialize

	super initialize.
	self initializeStorage!

initializeStorage

	storage := Array new: 1!

value

	^storage at: 1!

value: anObject

	storage
		at: 1
		put: anObject! !
!RsrRegistryElement categoriesFor: #initialize!public! !
!RsrRegistryElement categoriesFor: #initializeStorage!public! !
!RsrRegistryElement categoriesFor: #value!public! !
!RsrRegistryElement categoriesFor: #value:!public! !

!RsrRegistryElement class methodsFor!

value: anObject

	^self new
		value: anObject;
		yourself! !
!RsrRegistryElement class categoriesFor: #value:!public! !

RsrScientist guid: (GUID fromString: '{ca700baf-795f-44da-aef0-cc7d2ad19d68}')!
RsrScientist comment: ''!
!RsrScientist categoriesForClass!RemoteServiceReplication-Compatibility-Dolphin! !
!RsrScientist methodsFor!

instrument: aBlock
label: aString

	^aBlock value!

profile: aBlock
label: aString

	^aBlock value!

profile: aBlock
lable: aString
if: aCondition

	^aBlock value! !
!RsrScientist categoriesFor: #instrument:label:!public! !
!RsrScientist categoriesFor: #profile:label:!public! !
!RsrScientist categoriesFor: #profile:lable:if:!public! !

RsrSocket guid: (GUID fromString: '{401a4593-5b85-47ad-9860-48941a585902}')!
RsrSocket comment: ''!
!RsrSocket categoriesForClass!RemoteServiceReplication-Compatibility-Dolphin! !
!RsrSocket methodsFor!

accept

	^self class on: socket accept!

close

	socket close!

connectTo: aPort
on: aHostname

	socket := Socket2
		port: aPort
		host: aHostname.
	socket connect!

dataAvailable

	^socket notNil and: [socket hasInput]!

isConnected

	^socket notNil and: [socket isOpen]!

listenOn: aPort

	socket := ServerSocket2
		port: aPort
		backlog: 1!

read: aCount

	| bytes |
	bytes := ByteArray new: aCount.
	[socket receive: bytes]
		on: SocketClosed
		do: [:ex | socket close.  ex resignalAs: RsrSocketClosed new].
	^bytes!

readAvailable

	| bytes totalBytesRead bytesRead |
	bytes := ByteArray new: 4096.
	totalBytesRead := 0.
	[self dataAvailable]
		whileTrue:
			[bytes size = totalBytesRead
				ifTrue: [bytes := bytes, (ByteArray new: 4096)].
			bytesRead := socket
				receiveSome: bytes
				count: bytes size - totalBytesRead
				startingAt: totalBytesRead + 1.
			totalBytesRead := totalBytesRead + bytesRead].
	^bytes copyFrom: 1 to: totalBytesRead!

socket: aHostSocket

	socket := aHostSocket!

write: aByteArray

	socket send: aByteArray! !
!RsrSocket categoriesFor: #accept!public! !
!RsrSocket categoriesFor: #close!public! !
!RsrSocket categoriesFor: #connectTo:on:!public! !
!RsrSocket categoriesFor: #dataAvailable!public! !
!RsrSocket categoriesFor: #isConnected!public! !
!RsrSocket categoriesFor: #listenOn:!public! !
!RsrSocket categoriesFor: #read:!public! !
!RsrSocket categoriesFor: #readAvailable!public! !
!RsrSocket categoriesFor: #socket:!public! !
!RsrSocket categoriesFor: #write:!public! !

!RsrSocket class methodsFor!

on: aHostSocket

	^self new
		socket: aHostSocket;
		yourself! !
!RsrSocket class categoriesFor: #on:!public! !

RsrWeakRegistryElement guid: (GUID fromString: '{551e557a-1b07-488a-a72a-92a9aee28fdf}')!
RsrWeakRegistryElement comment: ''!
!RsrWeakRegistryElement categoriesForClass!RemoteServiceReplication-Compatibility-Dolphin! !
!RsrWeakRegistryElement methodsFor!

elementsExpired: anInteger
of: anArray

	finalizationSend ifNotNil: [:action | [action value] fork]!

initializeStorage

	storage := MourningWeakArray new: 1.
	storage pathologist: self!

toFinalizeEvaluate: anEvaluable

	finalizationSend := anEvaluable! !
!RsrWeakRegistryElement categoriesFor: #elementsExpired:of:!public! !
!RsrWeakRegistryElement categoriesFor: #initializeStorage!public! !
!RsrWeakRegistryElement categoriesFor: #toFinalizeEvaluate:!public! !

!RsrWeakRegistryElement class methodsFor!

value: aService
toFinalizeEvaluate: anEvaluable

	^(self value: aService)
		toFinalizeEvaluate: anEvaluable;
		yourself! !
!RsrWeakRegistryElement class categoriesFor: #value:toFinalizeEvaluate:!public! !

RsrProtoObject guid: (GUID fromString: '{8c807a21-ab7c-4f1d-9c7a-f012b4953ad7}')!
RsrProtoObject comment: ''!
!RsrProtoObject categoriesForClass!RemoteServiceReplication-Compatibility-Dolphin! !
RsrForwarder guid: (GUID fromString: '{63d391a4-77f2-42aa-82a9-31cb9e9ed808}')!
RsrForwarder comment: ''!
!RsrForwarder categoriesForClass!Unclassified! !

"Binary Globals"!
