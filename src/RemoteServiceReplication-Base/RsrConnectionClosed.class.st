"
This Announcement is used to signal that the specified Connection was closed.
"
Class {
	#name : 'RsrConnectionClosed',
	#superclass : 'RsrConnectionStateAnnouncement',
	#instVars : [
		'connection'
	],
	#category : 'RemoteServiceReplication-Base',
	#package : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrConnectionClosed class >> connection: aConnection [

	^self new
		connection: aConnection;
		yourself
]

{ #category : 'accessing' }
RsrConnectionClosed >> connection [
	"The Connection that was closed."

	^connection
]

{ #category : 'accessing' }
RsrConnectionClosed >> connection: aConnection [
	"Store the Connection that was closed."

	connection := aConnection
]
