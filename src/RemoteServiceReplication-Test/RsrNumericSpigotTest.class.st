Class {
	#name : 'RsrNumericSpigotTest',
	#superclass : 'RsrTestCase',
	#category : 'RemoteServiceReplication-Test',
	#package : 'RemoteServiceReplication-Test'
}

{ #category : 'accessing' }
RsrNumericSpigotTest >> spigotClass [

	^RsrNumericSpigot
]

{ #category : 'running' }
RsrNumericSpigotTest >> testDefault [

	| spigot |
	spigot := self spigotClass new.
	self
		assert: spigot next
		equals: 0.
	self
		assert: spigot next
		equals: 1
]

{ #category : 'running' }
RsrNumericSpigotTest >> testFloat [

	| spigot |
	spigot := self spigotClass
		start: 0
		step: 0.5.
	self
		assert: spigot next
		equals: 0.
	self
		assert: spigot next
		equals: 0.5.
	self
		assert: spigot next
		equals: 1.0.
]

{ #category : 'running' }
RsrNumericSpigotTest >> testNaturals [

	| spigot |
	spigot := self spigotClass naturals.
	self
		assert: spigot next
		equals: 1.
	self
		assert: spigot next
		equals: 2
]

{ #category : 'running' }
RsrNumericSpigotTest >> testNegativeStep [

	| spigot |
	spigot := self spigotClass
		start: 0
		step: -1.
	self
		assert: spigot next
		equals: 0.
	self
		assert: spigot next
		equals: -1.
	self
		assert: spigot next
		equals: -2
]

{ #category : 'running' }
RsrNumericSpigotTest >> testNext [

	| spigot |
	spigot := self spigotClass naturals.
	self
		assert: (Array with: 1 with: 2 with: 3)
		equals: (spigot next: 3)
]
