Extension { #name : 'RsrReference' }

{ #category : '*remoteservicereplication-gemstone' }
RsrReference class >> initializeReferenceMapping [
	"RsrReference initializeReferenceMapping"

	referenceMapping := Dictionary new.
	referenceMapping
		at: Symbol
		put: RsrSymbolReference.
	referenceMapping
		at: DoubleByteSymbol
		put: RsrSymbolReference.
	referenceMapping
		at: QuadByteSymbol
		put: RsrSymbolReference.
	referenceMapping
		at: String
		put: RsrStringReference.
	referenceMapping
		at: Unicode7
		put: RsrStringReference.
	referenceMapping
		at: Unicode16
		put: RsrStringReference.
	referenceMapping
		at: Unicode32
		put: RsrStringReference.
	referenceMapping
		at: DoubleByteString
		put: RsrStringReference.
	referenceMapping
		at: QuadByteString
		put: RsrStringReference.
	referenceMapping
		at: LargeInteger
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
		at: Boolean
		put: RsrTrueReference.
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
		at: SmallDateAndTime
		put: RsrDateAndTimeReference.
	referenceMapping
		at: SmallDouble
		put: RsrDoubleReference.
	referenceMapping
		at: Float
		put: RsrDoubleReference.
	^referenceMapping
]
