Class {
	#name : #BaselineOfMooseRoassal,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseRoassal
}

{ #category : #baselines }
BaselineOfMooseRoassal >> baseline: spec [
	<baseline>
	spec
		package: 'Trachel';
		package: 'Geometry';
		package: 'Athens-SVG';
		package: 'GToolkit-Examples';
		package: 'Roassal2'
			with: [ spec requires: #('Trachel' 'Athens-SVG' 'Geometry') ];
		package: 'Roassal2GT'
			with: [ spec requires: #('Roassal2' 'GToolkitExamples') ]
]
