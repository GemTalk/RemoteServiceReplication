Class {
	#name : 'RsrSocketStressTest',
	#superclass : 'RsrStressTest',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrSocketStressTest class >> defaultTimeLimit [
	"These tests take longer over a Socket"

	^120 seconds
]

{ #category : 'testing' }
RsrSocketStressTest class >> isAbstract [

	^self == RsrSocketStressTest
]
