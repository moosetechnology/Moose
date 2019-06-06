Class {
	#name : #BaselineOfMooseRoassal,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoose
}

{ #category : #baselines }
BaselineOfMooseRoassal >> baseline: spec [
	<baseline>
	spec
		package: 'Trachel';
		package: 'Geometry';
		package: 'Athens-SVG';
		package: 'GToolkit-Examples';
		package: 'Collections-OrderPreservingDictionary';
		package: 'Collections-BitmapCharacterSet';
		package: 'XML-Parser';
		package: 'Roassal2'
			with: [ spec requires: #('Trachel' 'Athens-SVG' 'Geometry' 'Collections-OrderPreservingDictionary' 'Collections-BitmapCharacterSet' 'XML-Parser') ];
		package: 'Roassal2GT'
			with: [ spec requires: #('Roassal2' 'GToolkitExamples') ]
]
