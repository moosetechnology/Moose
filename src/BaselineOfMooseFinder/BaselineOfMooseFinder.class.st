"
This baseline claim all the packages related with the main windows and glamour based tools 


spec
		package: 'Glamour-Tools';
		package: 'Glamour-Magritte-Presentations';
		package: 'Moose-Help';
		package: 'Moose-Finder' with: [ spec requires: #(MooseAlgos) ];
		package: 'Moose-RoassalPaintings';
		package: 'Moose-Tests-Finder';
		package: 'Moose-Tests-RoassalPaintings'
"
Class {
	#name : #BaselineOfMooseFinder,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseFinder
}

{ #category : #baselines }
BaselineOfMooseFinder >> baseline: spec [
	<baseline>
	self mooseAlgos: spec.
	spec
		package: 'Glamour-Tools';
		package: 'Glamour-Magritte-Presentations';
		package: 'Moose-Help';
		package: 'Moose-Finder' with: [ spec requires: #(MooseAlgos) ];
		package: 'Moose-RoassalPaintings';
		package: 'Moose-Tests-Finder';
		package: 'Moose-Tests-RoassalPaintings'
]

{ #category : #baselines }
BaselineOfMooseFinder >> mooseAlgos: spec [
	spec baseline: 'MooseAlgos' with: [ spec repository: self packageRepositoryURL. ]
]

{ #category : #baselines }
BaselineOfMooseFinder >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]
