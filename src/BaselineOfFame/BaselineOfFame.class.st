"
Baseline for the Fame project.
"
Class {
	#name : #BaselineOfFame,
	#superclass : #BaselineOf,
	#instVars : [
		'repository'
	],
	#category : #BaselineOfFame
}

{ #category : #baseline }
BaselineOfFame >> baseline: spec [
	<baseline>
	repository := self packageRepositoryURL.

	spec
		for: #common
		do: [ "Dependencies"
			self
				hashtable: spec;
				mocketry: spec;
				iterators: spec;
				treeQuery: spec.

			"Packages"
			spec
				package: 'Fame-Core' with: [ spec requires: #('Hashtable' 'TreeQuery' 'Iterators') ];
				package: 'Fame-Rules';
				package: 'Fame-ImportExport' with: [ spec requires: #('Fame-Core') ];
				package: 'Fame-Example';
				package: 'Fame-Tests' with: [ spec requires: #('Fame-Core' 'Fame-ImportExport' 'Fame-Example' 'Mocketry') ];
				package: 'Fame-GT' with: [ spec requires: #('Fame-ImportExport') ];
				package: 'Fame-Deprecated' with: [ spec requires: #('Fame-Tests') ].

			"Groups"
			spec
				group: 'Core' with: #('Fame-Core' 'Fame-ImportExport' 'Fame-Rules');
				group: 'GT' with: #('Core' 'Fame-GT');
				group: 'Tests' with: #('Fame-Tests') ].
			
	spec
		for: #'pharo7.x'
		do: [ 
			spec
				package: 'Fame-Pharo8Compatibility';
				package: 'Fame-Core' with: [ spec includes: #('Fame-Pharo8Compatibility') ] ]
]

{ #category : #dependencies }
BaselineOfFame >> hashtable: spec [
	spec baseline: 'Hashtable' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfFame >> iterators: spec [
	spec baseline: 'Iterators' with: [ 
		spec
			repository: 'github://juliendelplanque/Iterators:v1.x.x/src';
			loads: #('core' 'collections' 'shell-dsl' 'inspector-extensions') ]
]

{ #category : #dependencies }
BaselineOfFame >> mocketry: spec [
	spec
		baseline: 'Mocketry'
		with: [ spec
				loads: #('Core');
				repository: 'github://dionisiydk/Mocketry:v6.0.x' ]
]

{ #category : #accessing }
BaselineOfFame >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]

{ #category : #accessing }
BaselineOfFame >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfFame >> treeQuery: spec [
	spec baseline: 'TreeQuery' with: [ 
		spec
			repository: 'github://juliendelplanque/TreeQuery:v1.x.x/src';
			loads: #('core') ]
]
