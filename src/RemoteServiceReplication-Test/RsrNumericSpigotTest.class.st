Class {
	#name : 'RsrNumericSpigotTest',
	#superclass : 'RsrTestCase',
	#category : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrNumericSpigotTest >> spigotClass [

	^RsrNumericSpigot
]

{ #category : 'running' }
RsrNumericSpigotTest >> testDefault [

	self should: [ self spigotClass new ] raise: ShouldNotImplement 
]

{ #category : 'running' }
RsrNumericSpigotTest >> testFloat [

	| spigot |
	spigot := self spigotClass onInterval: (0 to: 1 by: 0.5).

	self
		assert: spigot next equals: 0;
		assert: spigot next equals: 0.5;
		assert: spigot next equals: 1.0;
		should: [ spigot next ] raise: RsrOutOfRange
]

{ #category : 'running' }
RsrNumericSpigotTest >> testNaturals [

	| spigot |
	spigot := self spigotClass onInterval: (1 to: 100).
	self assert: spigot next equals: 1.
	self assert: spigot next equals: 2
]

{ #category : 'running' }
RsrNumericSpigotTest >> testNegativeStep [

	| spigot |
	spigot := self spigotClass onInterval: (0 to: -12 by: -1).

	self assert: spigot next equals: 0.
	self assert: spigot next equals: -1.
	self assert: spigot next equals: -2
]

{ #category : 'running' }
RsrNumericSpigotTest >> testNext [

	| spigot |
	spigot := self spigotClass onInterval: (1 to: 100).
	self assert: (Array with: 1 with: 2 with: 3) equals: (spigot next: 3)
]
