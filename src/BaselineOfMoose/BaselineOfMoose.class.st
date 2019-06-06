"
rce: 22987863
"
Class {
	#name : #BaselineOfMoose,
	#superclass : #BaselineOf,
	#instVars : [
		'repository'
	],
	#category : #BaselineOfMoose
}

{ #category : #baseline }
BaselineOfMoose >> baseline: spec [
	<baseline>
	repository := self packageRepositoryURL.

	spec
		for: #common
		do: [
			self famix: spec.
			self baselineRoassal2: spec.
			self mooseFinder: spec.
			self mooseIDE: spec.
			self baselinePetitParser: spec.
			self baselinePetitParserUI: spec.
			
			self baselineSmaCC: spec.
			self baselineXMLWriter: spec.
			self baselineMerlin: spec.
			self baselineDistributionMap: spec.
			self baselineWizard: spec.
			
			"Package for the Moose IDE configuration"
			spec package: 'Moose-MenuBar'.
			spec package: 'Moose-Configuration'.
			
			self groups: spec ].

	spec
		for: #'pharo7.x'
		do: [ spec
				package: 'Famix-MetamodelBuilder-Core' with: [ spec includes: #('Famix-MetamodelBuilder-Core-Pharo7') ];
				package: 'Famix-MetamodelBuilder-Core-Pharo7' ].

	spec
		for: #'pharo8.x'
		do: [ spec package: 'Roassal2GT' with: [ spec includes: #('Glamour-Browsers-Pharo8' 'Glamour-Morphic-Renderer-Pharo8') ].
			spec package: 'Glamour-Browsers-Pharo8'.
			spec package: 'Glamour-Morphic-Renderer-Pharo8' ]
]

{ #category : #baseline }
BaselineOfMoose >> baselineDistributionMap: spec [ 

	self defineGroup: #'DistributionMap-Group' in: spec with: #(
		'Moose-DistributionMap'
		'Moose-Tests-DistributionMap'
	).
]

{ #category : #baseline }
BaselineOfMoose >> baselineMerlin: spec [ 

	self defineGroup: #'Merlin-Group' in: spec with: #(
		'Merlin'
	).
]

{ #category : #baseline }
BaselineOfMoose >> baselinePetitParser: spec [ 
    
	spec baseline: 'MoosePetitParser' with: [ spec repository: repository ]
]

{ #category : #baseline }
BaselineOfMoose >> baselinePetitParserUI: spec [
	spec
		project: 'MoosePetitParserUI'
		copyFrom: 'MoosePetitParser'
		with: [ spec loads: 'UI' ]
]

{ #category : #baseline }
BaselineOfMoose >> baselineRoassal2: spec [
	spec baseline: 'MooseRoassal' with: [ spec repository: repository ]
]

{ #category : #baseline }
BaselineOfMoose >> baselineSmaCC: spec [
	"
	https://github.com/j-brant/SmaCC
	git@github.com:j-brant/SmaCC.git
	branch: Pharo7
	"

	spec
		baseline: 'MooseSmaCC'
		with: [ spec
				repository: repository;
				load: #(FullNoUI) ]
]

{ #category : #baseline }
BaselineOfMoose >> baselineSmaCCJava: spec [
	spec
		project: 'MooseSmaCCJava'
		copyFrom: 'MooseSmaCC'
		with: [ spec loads: 'Java' ]
]

{ #category : #baseline }
BaselineOfMoose >> baselineSmaCCJavaUI: spec [
	spec
		project: 'MooseSmaCCJavaUI'
		copyFrom: 'MooseSmaCC'
		with: [ spec loads: #('Java' UI)  ]
]

{ #category : #baseline }
BaselineOfMoose >> baselineSmaCCUI: spec [
	spec
		project: 'MooseSmaCCUI'
		copyFrom: 'MooseSmaCC'
		with: [ spec loads: 'FullUI' ]
]

{ #category : #baseline }
BaselineOfMoose >> baselineWizard: spec [ 

	self defineGroup: #'Wizard-Group' in: spec with: #(
		'Moose-Wizard'
	).
]

{ #category : #baseline }
BaselineOfMoose >> baselineXMLWriter: spec [ 

	self defineGroup: #'XMLWriter-Group' in: spec with: #(
		'XML-Writer-Core'
		'XML-Writer-Tests'
		'Collections-Tests-OrderPreservingDictionary'
		'XML-Tests-Parser'
		'XML-Parser-GTExtensions'
	).
]

{ #category : #private }
BaselineOfMoose >> defineGroup: groupName in: spec with: packages [

	packages do: [ :packageName | spec package: packageName ].
	spec group: groupName with: packages
]

{ #category : #dependencies }
BaselineOfMoose >> famix: spec [
	spec baseline: 'Famix' with: [ spec repository: repository ]
]

{ #category : #baseline }
BaselineOfMoose >> groups: spec [ 
    
	spec group: 'BasicMetamodelling' with: #(
		Famix
	).

	spec group: 'BasicMetamodellingWithRoassal' with: #(
		BasicMetamodelling
		MooseRoassal
	).
	

	spec group: 'MooseFinderGroup' with: #(
		BasicMetamodellingWithRoassal
		MooseFinder
	).

	
	spec group: 'Parsing' with: #(
		MooseFinderGroup
		PetitParser-Group
		SmaCC-Group
	).
	
	
	spec group: 'AdditionalTools' with: #(
		Parsing
		XMLWriter-Group
		Merlin-Group
		Moose-DistributionMap
		Moose-Tests-DistributionMap
		Wizard-Group
		MooseIDE
	).
		
	spec group: 'default' with: #('AdditionalTools').
	

]

{ #category : #dependencies }
BaselineOfMoose >> mooseFinder: spec [
	spec baseline: 'MooseFinder' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfMoose >> mooseIDE: spec [
	spec baseline: 'MooseIDE' with: [ spec repository: repository ]
]

{ #category : #accessing }
BaselineOfMoose >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]

{ #category : #accessing }
BaselineOfMoose >> projectClass [
	^ MetacelloCypressBaselineProject
]
