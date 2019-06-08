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
		package: 'Roassal2'
			with: [ spec
				requires:
					#('Trachel' 'Athens-SVG' 'Geometry' 'Collections-BitmapCharacterSet' 'MooseXMLParser') ];
		package: 'Roassal2GT'
			with: [ spec requires: #('Roassal2' 'GToolkit-Examples') ]
]

{ #category : #baselines }
BaselineOfMooseRoassal >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]

{ #category : #baselines }
BaselineOfMooseRoassal >> xmlParser: spec [
	spec
		baseline: 'MooseXMLParser'
		with: [ spec
				repository: self packageRepositoryURL;
				loads: #CoreUI ]
]
