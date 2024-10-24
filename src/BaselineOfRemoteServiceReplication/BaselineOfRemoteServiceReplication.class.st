Class {
	#name : 'BaselineOfRemoteServiceReplication',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfRemoteServiceReplication'
}

{ #category : 'baselines' }
BaselineOfRemoteServiceReplication >> baseline: spec [
	<baseline>
	spec
		for: #common
			do: [ spec
				package: 'RemoteServiceReplication-Base';
				package: 'RemoteServiceReplication-Platform-Test'
					with: [ spec requires: #('RemoteServiceReplication') ];
				package: 'RemoteServiceReplication-Test'
					with: [ spec requires: #('RemoteServiceReplication-Platform-Test') ] ];
		for: #'pharo11.x'
			do: [ spec
				package: 'TonelFixes';
				package: 'RemoteServiceReplication-Pharo-11'
					with: [ spec requires: #('TonelFixes' 'RemoteServiceReplication-Base') ];
				package: 'RemoteServiceReplication'
					with: [ spec requires: #('RemoteServiceReplication-Pharo-11') ] ];
		for: #'pharo12.x'
			do: [ spec
				package: 'TonelFixes';
				package: 'RemoteServiceReplication-Pharo-12'
					with: [ spec requires: #('TonelFixes' 'RemoteServiceReplication-Base') ];
				package: 'RemoteServiceReplication'
					with: [ spec requires: #('RemoteServiceReplication-Pharo-12') ] ].
	spec
		group: 'default' with: #('All');
		group: 'All' with: #('RemoteServiceReplication-Test');
		group: 'Core' with: #('RemoteServiceReplication');
		group: 'Tests' with: #('RemoteServiceReplication-Test')
]

{ #category : 'accessing' }
BaselineOfRemoteServiceReplication >> projectClass [
	Smalltalk at: #'MetacelloCypressBaselineProject' ifPresent: [ :cl | ^ cl ].
	^ super projectClass
]
