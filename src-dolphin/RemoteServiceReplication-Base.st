Object
	subclass: #RsrConcurrency
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: 'current'!
!RsrConcurrency categoriesForClass!RemoteServiceReplication-Base-Concurrency! !

Object
	subclass: #RsrSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: 'speciesMapping'!
!RsrSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrArraySpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrArraySpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrBooleanSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrBooleanSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrByteArraySpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrByteArraySpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrCharacterArraySpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCharacterArraySpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrCharacterSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrCharacterSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrDateAndTimeSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrDateAndTimeSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrDictionarySpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrDictionarySpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrIntegerSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrIntegerSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrNullSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrNullSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrOrderedCollectionSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrOrderedCollectionSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrServiceSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrServiceSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrSetSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrSetSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrSpecies
	subclass: #RsrUndefinedObjectSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrUndefinedObjectSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

Error
	subclass: #RsrError
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrError categoriesForClass!RemoteServiceReplication-Base-Errors! !

RsrBooleanSpecies
	subclass: #RsrFalseSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrFalseSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrIntegerSpecies
	subclass: #RsrNegativeIntegerSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrNegativeIntegerSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrIntegerSpecies
	subclass: #RsrPositiveIntegerSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrPositiveIntegerSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrCharacterArraySpecies
	subclass: #RsrStringSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrStringSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrCharacterArraySpecies
	subclass: #RsrSymbolSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrSymbolSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrBooleanSpecies
	subclass: #RsrTrueSpecies
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrTrueSpecies categoriesForClass!RemoteServiceReplication-Base-Species! !

RsrError
	subclass: #RsrConnectionClosed
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrConnectionClosed categoriesForClass!RemoteServiceReplication-Base-Errors! !

RsrError
	subclass: #RsrUnknownClass
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrUnknownClass categoriesForClass!RemoteServiceReplication-Base-Errors! !

RsrError
	subclass: #RsrUnsupportedObject
	instanceVariableNames: 'object'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
!RsrUnsupportedObject categoriesForClass!RemoteServiceReplication-Base-Errors! !

!RsrServiceSpecies class methodsFor!
decodeReference: aStream

!RsrServiceSpecies class methodsFor!
speciesIdentifier

!RsrServiceSpecies class methodsFor!
decode: aStream

!RsrServiceSpecies class methodsFor!
encodeReference: aService

!RsrServiceSpecies class methodsFor!
encode: aService

!RsrStringSpecies class methodsFor!
speciesIdentifier

!RsrUnsupportedObject class methodsFor!
signal: anObject

!RsrNullSpecies class methodsFor!
decodeReference: aStream

!RsrNullSpecies class methodsFor!
speciesIdentifier

!RsrNullSpecies class methodsFor!
encodeReference: anObject

!RsrNullSpecies class methodsFor!
encode: anObject

!RsrByteArraySpecies class methodsFor!
encodeReference: aByteArray

!RsrByteArraySpecies class methodsFor!
decodeReference: aStream

!RsrByteArraySpecies class methodsFor!
speciesIdentifier

!RsrDictionarySpecies class methodsFor!
encodeReference: aDictionary

!RsrDictionarySpecies class methodsFor!
decodeReference: aStream

!RsrDictionarySpecies class methodsFor!
speciesIdentifier

!RsrOrderedCollectionSpecies class methodsFor!
encodeReference: anOrderedCollection

!RsrOrderedCollectionSpecies class methodsFor!
decodeReference: aStream

!RsrOrderedCollectionSpecies class methodsFor!
speciesIdentifier

!RsrIntegerSpecies class methodsFor!
encodeReference: anInteger

!RsrIntegerSpecies class methodsFor!
speciesIdentifier

!RsrIntegerSpecies class methodsFor!
integerAsByteArray: anInteger

!RsrCharacterArraySpecies class methodsFor!
decodeReference: aStream

!RsrCharacterArraySpecies class methodsFor!
speciesIdentifier

!RsrCharacterArraySpecies class methodsFor!
encodeReference: aCharacterArray

!RsrSetSpecies class methodsFor!
encodeReference: aSet

!RsrSetSpecies class methodsFor!
decodeReference: aStream

!RsrSetSpecies class methodsFor!
speciesIdentifier

!RsrArraySpecies class methodsFor!
encodeReference: anArray

!RsrArraySpecies class methodsFor!
decodeReference: aStream

!RsrArraySpecies class methodsFor!
speciesIdentifier

!RsrSymbolSpecies class methodsFor!
decodeReference: aStream using: aDecoder

!RsrSymbolSpecies class methodsFor!
speciesIdentifier

!RsrConcurrency class methodsFor!
fork: aBlock

!RsrConcurrency class methodsFor!
resetCurrent

!RsrConcurrency class methodsFor!
current

!RsrConcurrency class methodsFor!
current: concurrency

!RsrConcurrency class methodsFor!
fork: aBlock

!RsrSpecies class methodsFor!
speciesIdentifier

!RsrSpecies class methodsFor!
encode: anObject

!RsrSpecies class methodsFor!
nullSpecies

!RsrSpecies class methodsFor!
encodeReference: anObject

!RsrSpecies class methodsFor!
speciesMapping

!RsrSpecies class methodsFor!
speciesList

!RsrSpecies class methodsFor!
decodeReference: aStream

!RsrDateAndTimeSpecies class methodsFor!
encodeReference: aDateAndTime

!RsrDateAndTimeSpecies class methodsFor!
decodeReference: aStream

!RsrDateAndTimeSpecies class methodsFor!
speciesIdentifier

!RsrFalseSpecies class methodsFor!
decodeReference: aStream

!RsrFalseSpecies class methodsFor!
speciesIdentifier

!RsrBooleanSpecies class methodsFor!
encodeReference: aBoolean

!RsrBooleanSpecies class methodsFor!
speciesIdentifier

!RsrTrueSpecies class methodsFor!
decodeReference: aStream

!RsrTrueSpecies class methodsFor!
speciesIdentifier

!RsrPositiveIntegerSpecies class methodsFor!
decodeReference: aStream

!RsrPositiveIntegerSpecies class methodsFor!
speciesIdentifier

!RsrNegativeIntegerSpecies class methodsFor!
decodeReference: aStream

!RsrNegativeIntegerSpecies class methodsFor!
speciesIdentifier

!RsrCharacterSpecies class methodsFor!
encodeReference: aCharacter

!RsrCharacterSpecies class methodsFor!
decodeReference: aStream

!RsrCharacterSpecies class methodsFor!
speciesIdentifier

!RsrUndefinedObjectSpecies class methodsFor!
encodeReference: nilArgument

!RsrUndefinedObjectSpecies class methodsFor!
decodeReference: aStream

!RsrUndefinedObjectSpecies class methodsFor!
speciesIdentifier

!RsrUnsupportedObject methodsFor!
object

!RsrUnsupportedObject methodsFor!
messageText

!RsrUnsupportedObject methodsFor!
object: anObject

!RsrConcurrency methodsFor!
fork: aBlock

!RsrConcurrency methodsFor!
fork: aBlock

!RsrConnectionClosed methodsFor!
messageText