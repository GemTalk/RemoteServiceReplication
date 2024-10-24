Extension { #name : 'RsrReference' }

{ #category : '*RemoteServiceReplication-Pharo-12' }
RsrReference class >> initializeReferenceMapping [
	"RsrReference initializeReferenceMapping"

	referenceMapping := Dictionary new.
	referenceMapping
		at: ByteSymbol
		put: RsrSymbolReference.
	referenceMapping
		at: WideSymbol
		put: RsrSymbolReference.
	referenceMapping
		at: ByteString
		put: RsrStringReference.
	referenceMapping
		at: WideString
		put: RsrStringReference.
	referenceMapping
		at: LargePositiveInteger
		put: RsrIntegerReference.
	referenceMapping
		at: LargeNegativeInteger
		put: RsrIntegerReference.
	referenceMapping
		at: SmallInteger
		put: RsrIntegerReference.
	referenceMapping
		at: Character
		put: RsrCharacterReference.
	referenceMapping
		at: UndefinedObject
		put: RsrNilReference.
	referenceMapping
		at: True
		put: RsrTrueReference.
	referenceMapping
		at: False
		put: RsrFalseReference.
	referenceMapping
		at: Array
		put: RsrArrayReference.
	referenceMapping
		at: ByteArray
		put: RsrByteArrayReference.
	referenceMapping
		at: Set
		put: RsrSetReference.
	referenceMapping
		at: OrderedCollection
		put: RsrOrderedCollectionReference.
	referenceMapping
		at: Dictionary
		put: RsrDictionaryReference.
	referenceMapping
		at: DateAndTime
		put: RsrDateAndTimeReference.
	referenceMapping
		at: SmallFloat64
		put: RsrDoubleReference.
	referenceMapping
		at: BoxedFloat64
		put: RsrDoubleReference.
	^referenceMapping
]
