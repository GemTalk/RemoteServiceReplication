"
Encode and decode between Command object structures and whatever a Transport needs (typically a byte stream encoding, or if the Transport can transport Commands directly the Command objects themselves).

Stream based -- a pair of channel streams to communicate in Command objects with a Channel, and a pair of transport streams to communicate with a Transport.

On creation, a Codec is given a pair of transport streams. 
The Codec is then responsible for creating and making available the pair of channel streams.

A note on ""read"" vs. ""write."" 
In the stack of an RSR session, ""reading"" always refers to information coming into a Transport from its counterpart, and passing ""up"" the protocol stack toward the Session, and ""writing"" always refers to information passing ""down"" the stack from the Session toward the Transport.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	transportReadStream:		<ReadStream>
	transportWriteStream:		<WriteStream>


    Implementation Points
"
Class {
	#name : 'RsrCodec',
	#superclass : 'RsrObject',
	#instVars : [
		'transportReadStream',
		'transportWriteStream',
		'transport'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'accessing' }
RsrCodec >> channelReadStream [

	self subclassResponsibility
]

{ #category : 'accessing' }
RsrCodec >> channelWriteStream [

	self subclassResponsibility
]

{ #category : 'private' }
RsrCodec >> createChannelStreams [

	self subclassResponsibility
]

{ #category : 'testing' }
RsrCodec >> isOpen [

	^ transport ifNil: [ false ] ifNotNil: [ :t | t isOpen ]
]

{ #category : 'initialization' }
RsrCodec >> transport: anOpenTransport [

	anOpenTransport isOpen ifFalse: [ ^ RsrTransportNotOpen signal ].
	transport := anOpenTransport.
	transportReadStream := transport readStream.
	transportWriteStream := transport writeStream.
	self createChannelStreams
]
