Class {
	#name : #BaselineOfMooseFinder,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoose
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
