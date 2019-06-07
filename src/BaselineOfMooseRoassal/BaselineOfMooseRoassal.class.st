"
This baseline claims Roassal2 packages, and it direct dependancies. extracted from the roassal original baseline.


package: 'Trachel';
		package: 'Geometry';
		package: 'Athens-SVG';
		package: 'GToolkit-Examples';
		package: 'Collections-OrderPreservingDictionary';
		package: 'Collections-BitmapCharacterSet';
		package: 'XML-Parser';
		package: 'Roassal2'
"
Class {
	#name : #BaselineOfMooseRoassal,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseRoassal
}

{ #category : #baselines }
BaselineOfMooseRoassal >> baseline: spec [
	<baseline>
	
	self xmlParser: spec.
	spec
		package: 'Trachel';
		package: 'Geometry';
		package: 'Athens-SVG';
		package: 'GToolkit-Examples';
		package: 'Collections-BitmapCharacterSet';
		package: 'Roassal2'
			with: [ spec requires: #('Trachel' 'Athens-SVG' 'Geometry' 'Collections-BitmapCharacterSet' 'XMLParser') ];
		package: 'Roassal2GT'
			with: [ spec requires: #('Roassal2' 'GToolkitExamples') ]
]

{ #category : #baselines }
BaselineOfMooseRoassal >> xmlParser: spec [
	spec
		baseline: 'XMLParser'
		with: [ spec
				repository: self packageRepositoryURL;
				loads: #CoreUI ]
]
