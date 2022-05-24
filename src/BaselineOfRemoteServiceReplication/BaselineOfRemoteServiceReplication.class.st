Class {
	#name : 'BaselineOfRemoteServiceReplication',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfRemoteServiceReplication'
}

{ #category : 'baselines' }
BaselineOfRemoteServiceReplication >> baseline: spec [

	<baseline>
	spec
		for: #common do: [ 
			spec
				package: 'RemoteServiceReplication-Base';
				package: 'RemoteServiceReplication-Platform-Test'
				with: [ spec requires: #( 'RemoteServiceReplication-Factory-Pharo' ) ];
				package: 'RemoteServiceReplication-Test'
				with: [ 
					spec requires: #( 'RemoteServiceReplication-Platform-Test' ) ] ];
		for: #pharo do: [ 
		spec
			package: 'TonelFixes';
			package: 'RemoteServiceReplication-Pharo'
			with: [ 
				spec requires: #( 'TonelFixes' 'RemoteServiceReplication-Base' ) ];
			package: 'RemoteServiceReplication'
			with: [ spec requires: #( 'RemoteServiceReplication-Pharo' ) ];
			package: 'RemoteServiceReplication-Factory-Pharo'
			with: [ spec requires: #( 'RemoteServiceReplication' ) ] ].
	spec
		group: 'default' with: #( 'All' );
		group: 'All' with: #( 'RemoteServiceReplication-Test' );
		group: 'Core' with: #( 'RemoteServiceReplication-Factory-Pharo' );
		group: 'Tests' with: #( 'RemoteServiceReplication-Test' )
]

{ #category : 'accessing' }
BaselineOfRemoteServiceReplication >> projectClass [
	Smalltalk at: #'MetacelloCypressBaselineProject' ifPresent: [ :cl | ^ cl ].
	^ super projectClass
]
