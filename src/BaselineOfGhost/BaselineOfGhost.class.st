Class {
	#name : #BaselineOfGhost,
	#superclass : #BaselineOf,
	#instVars : [
		'repository'
	],
	#category : #BaselineOfGhost
}

{ #category : #baselines }
BaselineOfGhost >> baseline: spec [
	<baseline>
	repository := self packageRepositoryURL.

	spec
		for: #common
		do: [ self stateSpec: spec.

			spec
				package: 'Ghost-ObjectGhost';
				package: 'Ghost-ClassGhost' with: [ spec requires: #('Ghost-ObjectGhost') ];
				package: 'Ghost-ObjectMutation' with: [ spec requires: #('Ghost-ClassGhost') ];
				package: 'Ghost-ObjectGhost-Tests' with: [ spec requires: #('Ghost-ObjectGhost') ];
				package: 'Ghost-ClassGhost-Tests' with: [ spec requires: #('Ghost-ClassGhost') ];
				package: 'Ghost-ObjectMutation-Tests' with: [ spec requires: #('Ghost-ObjectMutation') ];
				package: 'Ghost-GTSupport' with: [ spec requires: #('Ghost-ObjectGhost') ];
				package: 'Ghost-Learning' with: [ spec requires: #('Ghost-ObjectGhost') ];
				package: 'Ghost-Learning-Tests' with: [ spec requires: #('Ghost-Learning') ].

			spec package: 'Ghost-StateSpecsSupport' with: [ spec requires: #('Ghost-ObjectGhost' 'StateSpecs') ].
			spec package: 'Ghost-StateSpecsSupport-Tests' with: [ spec requires: #('Ghost-StateSpecsSupport' 'Ghost-ObjectGhost-Tests') ].

			spec
				group: 'default' with: #('ObjectGhostTests' 'ClassGhostTests' 'ObjectMutationTests' 'GTSupport' 'LearningTests');
				group: 'ObjectGhost' with: #('Ghost-ObjectGhost');
				group: 'ObjectGhostTests' with: #('Ghost-ObjectGhost-Tests');
				group: 'ClassGhost' with: #('Ghost-ClassGhost');
				group: 'ClassGhostTests' with: #('Ghost-ClassGhost-Tests');
				group: 'ObjectMutation' with: #('Ghost-ObjectMutation');
				group: 'ObjectMutationTests' with: #('Ghost-ObjectMutation-Tests');
				group: 'GTSupport' with: #('Ghost-GTSupport');
				group: 'Learning' with: #('Ghost-Learning');
				group: 'LearningTests' with: #('Ghost-Learning-Tests');
				group: 'StateSpecsSupport' with: #('Ghost-StateSpecsSupport-Tests') ]
]

{ #category : #accessing }
BaselineOfGhost >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]

{ #category : #baselines }
BaselineOfGhost >> stateSpec: spec [
	spec baseline: 'StateSpecs' with: [ spec repository: repository ]
]
