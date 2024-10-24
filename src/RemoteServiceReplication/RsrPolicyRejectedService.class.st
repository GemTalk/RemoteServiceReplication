"
PolicyRejectedService signals to a caller that their peer's Connection Policy does not permit the described object's creation.
"
Class {
	#name : 'RsrPolicyRejectedService',
	#superclass : 'RsrReasonService',
	#instVars : [
		'sid',
		'templateName'
	],
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'instance creation' }
RsrPolicyRejectedService class >> sid: aSID
templateName: aTemplateName [
	"Create an instance of the PolicyRejectedService reason.
	The client is used here because once we send it, we are done with it.
	The client will GC and the server will later GC. We don't care to have
	a server hanging around if we don't need it."

	^self clientClass new
		sid: aSID;
		templateName: aTemplateName;
		yourself
]

{ #category : 'accessing' }
RsrPolicyRejectedService class >> templateClassName [

	^#RsrPolicyRejectedService
]

{ #category : 'accessing' }
RsrPolicyRejectedService >> sid [
	"Service ID"

	^sid
]

{ #category : 'accessing' }
RsrPolicyRejectedService >> sid: aSID [
	"Service ID"

	sid := aSID
]

{ #category : 'accessing' }
RsrPolicyRejectedService >> templateName [
	"The Template's name"

	^templateName
]

{ #category : 'accessing' }
RsrPolicyRejectedService >> templateName: aTemplateName [
	"The Template's name"

	templateName := aTemplateName
]
