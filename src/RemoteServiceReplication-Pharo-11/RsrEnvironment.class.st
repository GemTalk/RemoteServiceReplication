Class {
	#name : 'RsrEnvironment',
	#superclass : 'RsrObject',
	#category : 'RemoteServiceReplication-Pharo-11'
}

{ #category : 'branching' }
RsrEnvironment class >> ifPharo: aPharoBlock
ifGemStone: aGemStoneBlock
ifDolphin: aDolphinBlock [

	^aPharoBlock value
]
