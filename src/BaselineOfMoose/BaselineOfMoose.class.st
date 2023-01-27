"
rce: 22987863
"
Class {
	#name : #BaselineOfMoose,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoose
}

{ #category : #baselines }
BaselineOfMoose >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		self
			famix: spec;
			famixTagging: spec;
			famixReplication: spec; 
			mooseEasy: spec;
			mooseIDE: spec;
			neoCSV: spec.

		spec
			package: 'Moose-MenuBar' with: [ 
				spec requires:
						#( 'Famix' 'FamixTagging' 'FamixReplication'
						   'NeoCSV' 'MooseIDE' ) ];
			package: 'Moose-Configuration';
			package: 'Moose-Help';
			package: 'Famix-Visualizations' ]
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
BaselineOfMoose >> famixReplication: spec [

	spec
		baseline: 'FamixReplication'
		with: [ 
		spec repository: 'github://moosetechnology/FamixReplication:' ]
]

{ #category : #dependencies }
BaselineOfMoose >> famixTagging: spec [
	spec baseline: 'FamixTagging' with: [ spec repository: 'github://moosetechnology/FamixTagging:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> mooseEasy: spec [
	spec baseline: 'MooseEasy' with: [ spec repository: 'github://moosetechnology/Moose-Easy:v2/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> mooseIDE: spec [

	spec
		baseline: 'MooseIDE'
		with: [ 
		spec repository: 'github://moosetechnology/MooseIDE:development/src' ]
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
