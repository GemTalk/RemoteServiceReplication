Extension { #name : 'RsrReference' }

{ #category : '*RemoteServiceReplication-Pharo-13' }
RsrReference class >> referenceClassFor: anObject [
	"This method is called for each object in the transitive closure of a send to #remoteSelf.
	
	This implementation takes advantage of open-coded selectors. Testing shows it is 2.5x faster
	than a Dictionary lookup."

	| oc |	
	oc := anObject class.
	
	"Text"
	oc == ByteSymbol
		ifTrue: [^RsrSymbolReference].
	oc == WideSymbol
		ifTrue: [^RsrSymbolReference].
	oc == ByteString
		ifTrue: [^RsrStringReference].
	oc == WideString
		ifTrue: [^RsrStringReference].
	oc == Character
		ifTrue: [^RsrCharacterReference].
		
	"Numbers"
	oc == LargePositiveInteger
		ifTrue: [^RsrIntegerReference].
	oc == LargeNegativeInteger
		ifTrue: [^RsrIntegerReference].
	oc == SmallInteger
		ifTrue: [^RsrIntegerReference].
	oc == SmallFloat64
		ifTrue: [^RsrDoubleReference].
	oc == BoxedFloat64
		ifTrue: [^RsrDoubleReference].
	
	"Keywords"
	oc == UndefinedObject
		ifTrue: [^RsrNilReference].
	oc == True
		ifTrue: [^RsrTrueReference].
	oc == False
		ifTrue: [^RsrFalseReference].
	
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
	
	"Date/Time"
	oc == DateAndTime
		ifTrue: [^RsrDateAndTimeReference].
	
	"Services"
	(anObject isKindOf: RsrService)
		ifTrue: [^RsrServiceReference].

	"Unsupported"
	^RsrUnsupportedObject signal: anObject
]
