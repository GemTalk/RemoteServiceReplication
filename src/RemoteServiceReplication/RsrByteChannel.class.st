Class {
	#name : 'RsrByteChannel',
	#superclass : 'RsrObsoleteChannel',
	#instVars : [
		'sink',
		'source',
		'inStream',
		'outStream'
	],
	#category : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrByteChannel class >> inStream: inStream
outStream: outStream [

	^self new
		inStream: inStream;
		outStream: outStream;
		yourself
]

{ #category : 'accessing' }
RsrByteChannel >> inStream [
	"Returns the stream associated w/ reading"

	^inStream
]

{ #category : 'accessing' }
RsrByteChannel >> inStream: aBinaryReadStream [
	"Sets the stream associated w/ reading"

	inStream := aBinaryReadStream
]

{ #category : 'initializing' }
RsrByteChannel >> initialize [

	super initialize.
	source := RsrCommandSource on: self.
	sink := RsrCommandSink on: self
]

{ #category : 'testing' }
RsrByteChannel >> isConnected [

	^self inStream atEnd not and: [self outStream atEnd not]
]

{ #category : 'accessing' }
RsrByteChannel >> outStream [
	"Returns the stream associated w/ writing"

	^outStream
]

{ #category : 'accessing' }
RsrByteChannel >> outStream: aBinaryWriteStream [
	"Sets the stream associated w/ writing"

	outStream := aBinaryWriteStream
]

{ #category : 'command processing' }
RsrByteChannel >> send: aCommand [
	"Send the provided command over the channel"

	sink enqueue: aCommand
]

{ #category : 'accessing' }
RsrByteChannel >> sink [

	^sink
]

{ #category : 'accessing' }
RsrByteChannel >> source [

	^source
]
