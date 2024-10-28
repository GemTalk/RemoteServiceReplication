"
No class-specific documentation for RsrSymbolReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrCharacterArrayReference( value)
          RsrSymbolReference

"
Class {
	#name : 'RsrSymbolReference',
	#superclass : 'RsrCharacterArrayReference',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'accessing' }
RsrSymbolReference class >> typeIdentifier [

	^1
]

{ #category : 'converting' }
RsrSymbolReference >> convertBytes: aByteArray [

	^(super convertBytes: aByteArray) asSymbol
]
