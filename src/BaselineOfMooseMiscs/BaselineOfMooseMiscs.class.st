"
Some packages that are kind of not really related to anythign, but that would be better to have in separated baseline 

baseline: spec
	<baseline>
	spec
		package: 'Merlin';
		package: 'Moose-Wizard';
		package: 'Merlin';
		package: 'Moose-DistributionMap';
		package: 'Moose-Tests-DistributionMap'
"
Class {
	#name : #BaselineOfMooseMiscs,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseMiscs
}

{ #category : #baselines }
BaselineOfMooseMiscs >> baseline: spec [
	<baseline>
	spec
		package: 'Merlin';
		package: 'Moose-Wizard';
		package: 'Merlin';
		package: 'Moose-DistributionMap';
		package: 'Moose-Tests-DistributionMap'
]
