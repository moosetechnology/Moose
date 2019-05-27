"
Baseline of the Hashtable project
"
Class {
	#name : #BaselineOfHashtable,
	#superclass : #BaselineOf,
	#category : #BaselineOfHashtable
}

{ #category : #baseline }
BaselineOfHashtable >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'Hashtable';
				package: 'Hashtable-Tests' with: [ spec requires: #('Hashtable') ].
				
			"Groups"
			spec
				group: 'Core' with: #('Hashtable');
				group: 'Tests' with: #('Hashtable-Tests') ]
]

{ #category : #accessing }
BaselineOfHashtable >> projectClass [
	^ MetacelloCypressBaselineProject
]
