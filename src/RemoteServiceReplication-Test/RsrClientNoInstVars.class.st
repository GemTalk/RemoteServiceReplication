Class {
	#name : 'RsrClientNoInstVars',
	#superclass : 'RsrServiceNoInstVars',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'test selectors' }
RsrClientNoInstVars >> unimplementedRemoteSend [
	"Send a selector which is not implemented remotely resuling in a DNU."

	^remoteSelf doNotImplementThisSelectorOrYouWillBreakATest
]
