"
Encode and decode between Command objects and byte streams.


	channelReadStream:		<WriteStream>
	channelWriteStream:		<ReadStream>
""Yes, that seems backward. See superclass comment on terminology of ""read"" and ""write""
"
Class {
	#name : 'RsrByteCodec',
	#superclass : 'RsrCodec',
	#instVars : [
		'channelWriteStream',
		'channelReadStream'
	],
	#category : 'RemoteServiceReplication'
}
