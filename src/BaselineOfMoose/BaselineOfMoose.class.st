"
rce: 22987863
"
Class {
	#name : #BaselineOfMoose,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoose
}

{ #category : #baseline }
BaselineOfMoose >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		self
			famix: spec;
			famixTagging: spec;
			famixPresentation: spec;
			famixReplication: spec;
			mooseAlgos: spec;
			mooseEasy: spec;
			midas: spec;
			neoCSV: spec.
		spec
			package: 'Moose-Finder' with: [ 
				spec requires:
						#( 'Famix' 'FamixTagging' 'FamixReplication' 'FamixPresentation'
						   'MooseAlgos' 'Moose-RoassalPaintings'
						   'NeoCSV' 'Merlin' 'Glamour-Tools' ) ];
			package: 'Moose-MenuBar'
			with: [ spec requires: #( 'Moose-Finder' ) ];
			package: 'Moose-Configuration';
			package: 'Glamour-Tools';
			package: 'Glamour-Magritte-Presentations';
			package: 'Moose-Help';
			package: 'Moose-RoassalPaintings';
			package: 'Moose-Finder-Tests';
			package: 'Moose-RoassalPaintings-Tests';
			package: 'Merlin';
			package: 'Moose-DistributionMap';
			package: 'Moose-DistributionMap-Tests' ].
	spec for: #( #'pharo8.x' #'pharo9.x' ) do: [ 
		spec
			package: 'Moose-Finder-Pharo8';
			package: 'Moose-Finder'
			with: [ spec includes: #( 'Moose-Finder-Pharo8' ) ].
		spec for: #( #NewTools ) do: [ 
			spec
				package: 'Moose-Finder-Pharo8';
				package: 'Moose-Finder2';
				package: 'Moose-Finder'
				with: [ spec includes: #( 'Moose-Finder-Pharo8'
						   'Moose-Finder2' ) ] ] ]
]

{ #category : #baseline }
BaselineOfMoose >> customProjectAttributes [
	^ (Smalltalk classNamed: 'StInspector')
		  ifNotNil: [ #( #NewTools ) ]
		  ifNil: [ #(  ) ]
]

{ #category : #dependencies }
BaselineOfMoose >> famix: spec [
	spec baseline: 'Famix' with: [ spec repository: 'github://moosetechnology/Famix:development/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> famixPresentation: spec [
	spec baseline: 'FamixPresentation' with: [ spec repository: 'github://moosetechnology/FamixPresentation:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> famixReplication: spec [
	spec baseline: 'FamixReplication' with: [ spec repository: 'github://moosetechnology/FamixReplication:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> famixTagging: spec [
	spec baseline: 'FamixTagging' with: [ spec repository: 'github://moosetechnology/FamixTagging:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> midas: spec [

	spec
		baseline: 'Midas'
		with: [ 
		spec repository: 'github://moosetechnology/Midas:development/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> mooseAlgos: spec [
	spec
		baseline: 'MooseAlgos'
		with: [ spec
				loads: 'Core';
				repository: 'github://moosetechnology/MooseAlgos:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> mooseEasy: spec [
	spec baseline: 'MooseEasy' with: [ spec repository: 'github://moosetechnology/Moose-Easy:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> neoCSV: spec [
	spec
		baseline: 'NeoCSV'
		with: [ spec
				loads: 'core';
				repository: 'github://svenvc/NeoCSV/repository' ]
]

{ #category : #accessing }
BaselineOfMoose >> projectClass [
	^ MetacelloCypressBaselineProject
]
