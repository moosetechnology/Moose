"
This baseline claims Petitparser packages. Define the minimal requirements relationships. It does also provides groups for loading with and without UI
"
Class {
	#name : #BaselineOfMoosePetitParser,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoosePetitParser
}

{ #category : #baselines }
BaselineOfMoosePetitParser >> baseline: spec [
	<baseline>
	self roassal2: spec.

	spec
		package: 'PetitParser';
		package: 'PetitTests' with: [ spec requires: #('PetitParser') ];
		package: 'PetitAnalyzer' with: [ spec requires: #('PetitParser') ];
		package: 'PetitMSE' with: [ spec requires: #('PetitParser' 'PetitTests') ];
		package: 'PetitGui' with: [ spec requires: #('Roassal2' 'PetitAnalyzer') ].

	spec group: 'default' with: #('PetitParser' 'PetitMSE').
	spec group: 'UI' with: #('default' 'PetitGui')
]

{ #category : #baselines }
BaselineOfMoosePetitParser >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]

{ #category : #accessing }
BaselineOfMoosePetitParser >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #dependencies }
BaselineOfMoosePetitParser >> roassal2: spec [
	spec
		baseline: 'Roassal2'
		with: [ spec
				loads: 'Core';
				repository: 'github://ObjectProfile/Roassal2:c1da8614c951008ea501f126ef3ccf25d73580ac/src' ]
]
