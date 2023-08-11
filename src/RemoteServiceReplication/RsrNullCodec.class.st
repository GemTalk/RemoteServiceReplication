"
Pass through Command objects between the streams unmodified.

In fact, null codecs don't even copy between the streams, they just let the transport streams do double duty as the channel streams.
"
Class {
	#name : 'RsrNullCodec',
	#superclass : 'RsrCodec',
	#category : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrNullCodec >> channelReadStream [

	"Null codec just passes the stream through"

	^transportReadStream 
]

{ #category : 'accessing' }
RsrNullCodec >> channelWriteStream [

	"Null codec just passes the stream through"

	^transportWriteStream 
]

{ #category : 'private' }
RsrNullCodec >> createChannelStreams [

	"Do nothing; transport streams are used as channel streams for null codec."
]
