"
I manage communication between an RsrSession and an RsrTransport. I communicate with my Session via messages that have a Command as an argument. Communication with the Transport is via a pair of streams. Depending on the type of Transport, this can be a byte stream or an object stream, the latter being able to transmit Command objects as well as byte objects.

I delegate to HandshakeSteps to open a channel, and to ChannelLoops once the channel is open. An appropriate RsrCodec is used to translate between higher-level objects and objects (often bytes) that are the language spoken by the Transport.
 
Internal Representation and Key Implementation Points.

    Instance Variables

	openingSteps:		<SequenceableCollection of RsrHandshakeSteps> 
			The steps to be followed, in order, to open the channel on top of an already-open Transport.

	rsrSession:		<RsrSession> 
			The session I serve.
			
	shouldInitiate:	<Boolean>
			True if during openingSteps that require asymmetry I am the party that should
			""speak"" first, False if I am the party that should listen and reply,
			nil if my handshake role has not yet been determined.
			Once I am an open Channel, I am a peer of my counterpart Channel and this
			distinction is not needed.

	sink:		<RsrCommandSink> 
			Manages a Process which takes Command objects, encodes them if necessary, 
			and puts them on my Transport's writeStream

	source:		<RsrCommandSource> 
			Manages a Process which Reads from my Transport's readStream and decodes
			what is received into Command objects. 

	transport:		<RsrTransport>
			One end of a low-level means for communicating with another Session through
			another Channel


    Implementation Points
"
Class {
	#name : 'RsrChannel',
	#superclass : 'RsrObject',
	#instVars : [
		'rsrSession',
		'transport',
		'sink',
		'source',
		'openingSteps',
		'shouldInitiate'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrChannel class >> transport: aTransport [

	"Answer an instance that will use the given Transport and with a default collection of 
	openingSteps. The instance is not yet open."

	^ self new transport: aTransport
]

{ #category : 'initialization' }
RsrChannel >> defaultOpeningSteps [

	"Answer the default sequence of handshake classes that will handle opening an instance. 
	These default step classes can be appended to by sending an instance #addOpeningStep:
	or overridden altogather by sending #openingSteps"

	^ { 
		  RsrHandshakeRoleNegotiation.
		  RsrProtocolVersionNegotiation }
]

{ #category : 'initialization' }
RsrChannel >> initialize [

	super initialize.
	sink := RsrCommandSink on: self.
	source := RsrCommandSource on: self.
	self openingSteps: self defaultOpeningSteps
]

{ #category : 'accessing' }
RsrChannel >> openingSteps: aSequenceableCollection [

	"Note that this is a collection of *classes*, not instances.
	Each responds to the protocol of RsrHandshakeStep."

	openingSteps := aSequenceableCollection
]

{ #category : 'accessing' }
RsrChannel >> shouldInitiate: aBoolean [

	shouldInitiate := aBoolean
]
