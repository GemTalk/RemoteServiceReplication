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
RsrSessionClosed class >> rsrSession: aConnection [

	^self new
		rsrSession: aConnection;
		yourself
]

{ #category : 'accessing' }
RsrSessionClosed >> rsrSession [
	"The Connection that was closed."

	^connection
]

{ #category : 'accessing' }
RsrSessionClosed >> rsrSession: aConnection [
	"Store the Connection that was closed."

	connection := aConnection
]
