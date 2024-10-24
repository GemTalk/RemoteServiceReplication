Class {
	#name : 'RsrEnvironment',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-Pharo-12',
	#package : 'RemoteServiceReplication-Pharo-12'
}

{ #category : 'branching' }
RsrEnvironment class >> ifPharo: aPharoBlock
ifGemStone: aGemStoneBlock
ifDolphin: aDolphinBlock [

	^aPharoBlock value
]
