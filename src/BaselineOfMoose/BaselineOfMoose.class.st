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
		do: [ " Meta Model"
			self famix: spec.
			"IDE"
			self mooseIDE: spec.
			" Petit parser with/without UI"
			self baselinePetitParser: spec.
			self baselinePetitParserUI: spec.
			" SmaCC with/without UI"
			self baselineSmaCC: spec.
			self baselineSmaCCUI: spec.
			self baselineSmaCCJava: spec.
			self baselineSmaCCJavaUI: spec.
			"Miscelaneous (Merlin, Wizard, etc)"
			self baselineMiscs: spec.
			self groups: spec.
			self newGroups: spec ].
	spec
		for: #'pharo7.x'
		do: [ spec
				package: 'Famix-MetamodelBuilder-Core'
					with: [ spec includes: #('Famix-MetamodelBuilder-Core-Pharo7') ];
				package: 'Famix-MetamodelBuilder-Core-Pharo7' ]
]

{ #category : #baseline }
BaselineOfMoose >> baselineMiscs: spec [
	spec baseline: 'MooseMiscs' with: [ spec repository: repository ]
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
				loads: #(FullNoUI) ]
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
	spec group: 'MooseIDEGroup' with: #(
		BasicMetamodelling
		MooseIDE
	).
	spec group: 'Parsing' with: #(
		MooseIDEGroup
		MoosePetitParserUI
		MooseSmaCCUI
	).
	spec group: 'AdditionalTools' with: #(
		Parsing
		MooseMiscs
		MooseIDE
	).
	spec group: 'default' with: #('AdditionalTools').
	

]

{ #category : #dependencies }
BaselineOfMoose >> mooseIDE: spec [
	spec baseline: 'MooseIDE' with: [ spec repository: repository ]
]

{ #category : #baseline }
BaselineOfMoose >> newGroups: spec [ 
 
  "Only Famix"
	spec group: 'Core' with: #(
		Famix
	).
	"Famix-Java"
	
	spec group: 'Java' with: #(
		Core
		MooseSmaCCJava
	).
	"Famix-Java and UI"
	spec group: 'JavaUI' with: #(
		Core
		MooseSmaCCJavaUI
		MooseIDE
	).
	
	"Famix and PetitParser"
	spec group: 'CorePetitParser' with: #(
		Core
		MoosePetitParser
	).
	"Famix petit parser and UI"
	spec group: 'CorePetitParserUI' with: #(
		Core
		MooseIDE
		MoosePetitParserUI
	).
	
	spec group: 'GraphicTools' with: #(
		Core
		MooseIDE
		MooseMiscs
	).
	
	"Famix and SmaCC"
	spec group: 'CoreSmaCC' with: #(
		Core
		MooseSmaCC
	).
	"Famix and SmaCC-UI"
	spec group: 'CoreSmaCCUI' with: #(
		Core
		MooseIDE
		MooseSmaCCUI
	).
	spec group: 'CoreParsers' with: #(
		Core
		MooseSmaCC
		MoosePetitParser
	).
	
	spec group: 'CoreParsersUI' with: #(
		Core
		MooseIDE
		MooseSmaCCUI
		MoosePetitParserUI
	).

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
