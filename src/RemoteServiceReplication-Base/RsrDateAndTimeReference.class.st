"
No class-specific documentation for RsrDateAndTimeReference, hierarchy is:
Object
  RsrObject
    RsrReference
      RsrImmediateReference
        RsrValueReference( value)
          RsrDateAndTimeReference

"
Class {
	#name : 'RsrDateAndTimeReference',
	#superclass : 'RsrValueReference',
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrDateAndTimeReference class >> from: aDateAndTime [

	| intermediate |
	intermediate := RsrDateAndTime microsecondsSinceEpoch: aDateAndTime.
	^self intermediate: intermediate
]

{ #category : 'encoding/decoding' }
RsrDateAndTimeReference >> decode: aStream
using: aDecoder [

	aDecoder
		decodeDateAndTimeReference: self
		from: aStream
]

{ #category : 'encoding/decoding' }
RsrDateAndTimeReference >> encode: aStream
using: anEncoder [

	anEncoder
		encodeDateAndTimeReference: self 
		onto: aStream
]

{ #category : 'resolving' }
RsrDateAndTimeReference >> resolve: aConnection [

	^RsrDateAndTime fromMicroseconds: intermediate
]
