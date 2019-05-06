"
Baseline of the RoelTyper project
"
Class {
	#name : #BaselineOfRoelTyper,
	#superclass : #BaselineOf,
	#category : #BaselineOfRoelTyper
}

{ #category : #baselines }
BaselineOfRoelTyper >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'RoelTyper';
				package: 'RoelTyper-Tests' with: [ spec requires: #('RoelTyper') ].

			"Groups"
			spec
				group: 'Core' with: #('RoelTyper');
				group: 'Tests' with: #('RoelTyper-Tests') ]
]
