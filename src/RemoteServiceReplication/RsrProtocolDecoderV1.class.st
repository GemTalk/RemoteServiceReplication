Class {
	#name : 'RsrProtocolDecoderV1',
	#superclass : 'RsrProtocolDecoder',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'decoding-services' }
RsrProtocolDecoderV1 >> decodeServiceSnapshot: aStream [

	| species sid targetClassName slots instVarCount templateName targetClass template persona |
	species := self decodeControlWord: aStream.
	sid := self decodeControlWord: aStream.
	instVarCount := self decodeControlWord: aStream.
	targetClassName := (self decodeReference: aStream) resolve: nil.
	slots := OrderedCollection new: instVarCount.
	instVarCount timesRepeat: [slots add: (self decodeReference: aStream)].
	
	"This is an effort to duplicate old behavior and quirks.
	See: https://github.com/GemTalk/RemoteServiceReplication/blob/f84398f10f4bebe213450ee80ef35c1813287903/src/RemoteServiceReplication/RsrServiceSnapshot.class.st#L93"
	targetClass := RsrClassResolver
		classNamed: targetClassName
		ifAbsent: [^nil].
	templateName := targetClass templateClassName.
	template := RsrClassResolver
		classNamed: templateName
		ifAbsent: [^nil].
	persona := targetClassName == template serverClassName
		ifTrue: [#server]
		ifFalse: [#client].

	^RsrServiceSnapshot new
		sid: sid;
		templateName: templateName;
		persona: persona;
		slots: slots;
		yourself
]
