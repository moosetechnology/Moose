Class {
	#name : #BaselineOfMocketry,
	#superclass : #BaselineOf,
	#instVars : [
		'repository'
	],
	#category : #BaselineOfMocketry
}

{ #category : #baselines }
BaselineOfMocketry >> baseline: spec [
	<baseline>
	
	repository := self packageRepositoryURL.
	
	spec
		for: #common
		do: [ self
				stateSpec: spec;
				ghost: spec.

			spec
				package: 'Mocketry-Specs' with: [ spec requires: #('StateSpecs') ];
				package: 'Mocketry-Domain' with: [ spec requires: #('Mocketry-Specs' 'GhostCore') ];
				package: 'Mocketry-Help' with: [ spec requires: #('Mocketry-Domain') ];
				package: 'Mocketry-Specs-Tests' with: [ spec requires: #('Mocketry-Specs') ];
				package: 'Mocketry-Domain-Tests' with: [ spec requires: #('Mocketry-Specs' 'GhostTests') ].

			spec
				group: 'default' with: #('Core' 'Tests');
				group: 'Core' with: #('Mocketry-Specs' 'Mocketry-Domain');
				group: 'Tests' with: #('Mocketry-Specs-Tests' 'Mocketry-Domain-Tests' 'Mocketry-Help') ]
]

{ #category : #baselines }
BaselineOfMocketry >> ghost: spec [
	spec
		baseline: 'Ghost' with: [ spec repository: repository ];
		project: 'GhostCore' copyFrom: 'Ghost' with: [ spec loads: #('ObjectGhost' 'GTSupport' 'StateSpecsSupport' 'ObjectMutation') ];
		project: 'GhostTests' copyFrom: 'Ghost' with: [ spec loads: #('ObjectGhostTests' 'StateSpecsSupport' 'ClassGhostTests' 'ObjectMutationTests') ]
]

{ #category : #accessing }
BaselineOfMocketry >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]

{ #category : #accessing }
BaselineOfMocketry >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #baselines }
BaselineOfMocketry >> stateSpec: spec [
	spec baseline: 'StateSpecs' with: [ spec repository: repository ]
]
