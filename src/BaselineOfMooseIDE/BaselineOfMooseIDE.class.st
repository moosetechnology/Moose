"
This baseline claims the menu-bar and confs. It should be unified with the finder maybe?


	spec
		package: 'Moose-MenuBar';
		package: 'Moose-Configuration'
"
Class {
	#name : #BaselineOfMooseIDE,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseIDE
}

{ #category : #baselines }
BaselineOfMooseIDE >> baseline: spec [
	<baseline>
	self
		mooseAlgos: spec;
		mooseEasy: spec;
		roassal2: spec.

	spec
		package: 'Moose-MenuBar' with: [ spec requires: #('Moose-Finder') ];
		package: 'Moose-Configuration';
		package: 'Glamour-Tools';
		package: 'Glamour-Magritte-Presentations';
		package: 'Moose-Help';
		package: 'Moose-Finder' with: [ spec requires: #('MooseAlgos' 'Moose-RoassalPaintings') ];
		package: 'Moose-RoassalPaintings' with: [ spec requires: #('Roassal2') ];
		package: 'Moose-Tests-Finder';
		package: 'Moose-Tests-RoassalPaintings'
]

{ #category : #baselines }
BaselineOfMooseIDE >> mooseAlgos: spec [
	spec
		baseline: 'MooseAlgos'
		with: [ spec
				loads: 'Core';
				repository: 'github://moosetechnology/MooseAlgos:v1.x.x/src' ]
]

{ #category : #baselines }
BaselineOfMooseIDE >> mooseEasy: spec [
	spec baseline: 'MooseEasy' with: [ spec repository: 'github://moosetechnology/Moose-Easy:v1.x.x/src' ]
]

{ #category : #baselines }
BaselineOfMooseIDE >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]

{ #category : #accessing }
BaselineOfMooseIDE >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfMooseIDE >> roassal2: spec [
	spec
		baseline: 'Roassal2'
		with: [ spec
				loads: 'Core';
				repository: 'github://ObjectProfile/Roassal2:c1da8614c951008ea501f126ef3ccf25d73580ac/src' ]
]
