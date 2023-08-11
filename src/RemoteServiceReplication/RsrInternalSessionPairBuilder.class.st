"
RsrInternalSessionPairBuilders specify and build pairs of connected Sessions, both within the same VM. When sent #buildPair, which on success answers an Array of two peer Sessions.
"
Class {
	#name : 'RsrInternalSessionPairBuilder',
	#superclass : 'RsrSessionBuilder',
	#category : 'RemoteServiceReplication'
}

{ #category : 'building' }
RsrInternalSessionPairBuilder >> buildPair [

	"Answer a pair of peer Sessions within this VM"

	self subclassResponsibility
]
