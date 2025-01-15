"
No class-specific documentation for RsrDecoder, hierarchy is:
Object
  RsrObject
    RsrCodec
      RsrDecoder( registry connection decodeCommandMap)

"
Class {
	#name : 'RsrProtocolDecoderV2',
	#superclass : 'RsrProtocolDecoder',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrProtocolDecoderV2 class >> registry: aRegistry [

	^self new
		registry: aRegistry;
		yourself
]

{ #category : 'decoding-services' }
RsrProtocolDecoderV2 >> decodeServiceSnapshot: aStream [

	| species sid templateName persona slots instVarCount |
	species := self decodeControlWord: aStream.
	sid := self decodeControlWord: aStream.
	instVarCount := self decodeControlWord: aStream.
	templateName := (self decodeReference: aStream) resolve: nil.
	persona := (self decodeReference: aStream) resolve: nil.
	slots := OrderedCollection new: instVarCount.
	instVarCount timesRepeat: [slots add: (self decodeReference: aStream)].

	^RsrServiceSnapshot new
		sid: sid;
		templateName: templateName;
		persona: persona;
		slots: slots;
		yourself
]
