"
This Announcement is used to signal that the specified RsrSession was closed.
"
Class {
	#name : 'RsrSessionClosed',
	#superclass : 'RsrSessionStateAnnouncement',
	#instVars : [
		'rsrSession'
	],
	#category : 'RemoteServiceReplication-Base'
}

{ #category : 'instance creation' }
RsrSessionClosed class >> rsrSession: anRsrSession [

	^self new
		rsrSession: anRsrSession;
		yourself
]

{ #category : 'accessing' }
RsrSessionClosed >> rsrSession [
	"The Session that was closed."

	^rsrSession
]

{ #category : 'accessing' }
RsrSessionClosed >> rsrSession: anRsrSession [
	"Store the Session that was closed."

	rsrSession := anRsrSession
]
