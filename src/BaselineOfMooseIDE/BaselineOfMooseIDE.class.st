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
		self mooseAlgos: spec.
	spec
		package: 'Moose-MenuBar';
		package: 'Moose-Configuration';
		package: 'Glamour-Tools';
		package: 'Glamour-Magritte-Presentations';
		package: 'Moose-Help';
		package: 'Moose-Finder' with: [ spec requires: #(MooseAlgos) ];
		package: 'Moose-RoassalPaintings';
		package: 'Moose-Tests-Finder';
		package: 'Moose-Tests-RoassalPaintings'
]

{ #category : #baselines }
BaselineOfMooseIDE >> mooseAlgos: spec [
	spec baseline: 'MooseAlgos' with: [ spec repository: self packageRepositoryURL. ]
]

{ #category : #baselines }
BaselineOfMooseIDE >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]
