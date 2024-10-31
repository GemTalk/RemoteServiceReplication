Extension { #name : 'RsrReference' }

{ #category : '*remoteservicereplication-gemstone' }
RsrReference class >> referenceClassFor: anObject [
	"This method is called for each object in the transitive closure of a send to #remoteSelf.

	This implementation takes advantage of open-coded selectors. Testing in Pharo showed this
	is 2.5x faster than a Dictionary lookup. This multiplier is likely different in GemStone
	but hasn't be tested."

	| oc |
	oc := anObject class.

	"Text"
	oc == Symbol
		ifTrue: [^RsrSymbolReference].
	oc == DoubleByteSymbol
		ifTrue: [^RsrSymbolReference].
	oc == QuadByteSymbol
		ifTrue: [^RsrSymbolReference].
	oc == String
		ifTrue: [^RsrStringReference].
	oc == Unicode7
		ifTrue: [^RsrStringReference].
	oc == Unicode16
		ifTrue: [^RsrStringReference].
	oc == Unicode32
		ifTrue: [^RsrStringReference].
	oc == DoubleByteString
		ifTrue: [^RsrStringReference].
	oc == QuadByteString
		ifTrue: [^RsrStringReference].
	oc == Character
		ifTrue: [^RsrCharacterReference].

	"Numbers"
	oc == LargeInteger
		ifTrue: [^RsrIntegerReference].
	oc == SmallInteger
		ifTrue: [^RsrIntegerReference].
	oc == SmallDouble
		ifTrue: [^RsrDoubleReference].
	oc == Float
		ifTrue: [^RsrDoubleReference].

	"Keywords"
	oc == UndefinedObject
		ifTrue: [^RsrNilReference].
	oc == Boolean
		ifTrue: [^RsrTrueReference].

	"Collections"
	oc == Array
		ifTrue: [^RsrArrayReference].
	oc == ByteArray
		ifTrue: [^RsrByteArrayReference].
	oc == Set
		ifTrue: [^RsrSetReference].
	oc == OrderedCollection
		ifTrue: [^RsrOrderedCollectionReference].
	oc == Dictionary
		ifTrue: [^RsrDictionaryReference].
	oc == DateAndTime
		ifTrue: [^RsrDateAndTimeReference].
	oc == SmallDateAndTime
		ifTrue: [^RsrDateAndTimeReference].

	"Services"
	(anObject isKindOf: RsrService)
		ifTrue: [^RsrServiceReference].

	"Unsupported"
	^RsrUnsupportedObject signal: anObject
]
