"
The Connection Policy

This class defines the abstract interface for Policy. Policy provides a means of preventing Service replication. When a Service is created in a remote Connection and replicated locally, we first verify that the Policy allows the instantiation of the Service Template first. If the Policy does now allow a Service to be created, the incoming message send will be cancelled. RSR will report the message failure with a RsrPolicyRejectedService reason.

Note:
Subclasses of RsrReasonService are alway permitted as they are required by the framework.
"
Class {
	#name : 'RsrAbstractPolicy',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication',
	#package : 'RemoteServiceReplication'
}

{ #category : 'testing' }
RsrAbstractPolicy >> permits: aTemplate [
	"Returning true to allow the framework to instantiate 
	a Service received over the Connection."

	self subclassResponsibility
]
