"
This Announcement is used to signal that the specified RsrSession was closed.
"
Class {
	#name : 'RsrSessionClosed',
	#superclass : 'RsrSessionStateAnnouncement',
	#instVars : [
		'connection'
	],
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrSessionClosed class >> connection: aConnection [

	^self new
		connection: aConnection;
		yourself
]

{ #category : 'accessing' }
RsrSessionClosed >> connection: aConnection [
	"Store the Connection that was closed."

	connection := aConnection
]

{ #category : 'accessing' }
RsrSessionClosed >> rsrSession [
	"The Connection that was closed."

	^connection
]
