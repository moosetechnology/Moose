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
		do: [ spec package: 'Moose-PharoOverrides'.
			self baselineGrease: spec.
			self baselineMagritte3: spec.

			self famix: spec.

			spec package: 'GToolkit-Examples'.

			self baselineGeometry: spec.
			self baselineAthens: spec.
			self baselineRoassal2: spec.

			self mooseAlgos: spec.

			self baselineOrderPreservingDictionary: spec.

			self baselineBitmapCharacterSet: spec.
			self baselineXMLParser: spec.
			spec
				package: 'Glamour-Tools';
				package: 'Glamour-Magritte-Presentations';
				package: 'Moose-Help'.
			self baselineMetanool: spec.
			spec
				package: 'Moose-Finder';
				package: 'Moose-RoassalPaintings';
				package: 'Moose-Tests-Finder';
				package: 'Moose-Tests-RoassalPaintings'.
			self baselinePetitParser: spec.

			self baselineSmaCC: spec.
			self baselineXMLWriter: spec.
			self baselineMerlin: spec.
			self baselineDistributionMap: spec.
			self baselineWizard: spec.
			spec package: 'Moose-MenuBar'.
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
BaselineOfMoose >> baselineAthens: spec [ 
    
	spec package: 'Athens-SVG'
]

{ #category : #baseline }
BaselineOfMoose >> baselineBitmapCharacterSet: spec [ 
    
	spec package: 'Collections-BitmapCharacterSet'
]

{ #category : #baseline }
BaselineOfMoose >> baselineDistributionMap: spec [ 

	self defineGroup: #'DistributionMap-Group' in: spec with: #(
		'Moose-DistributionMap'
		'Moose-Tests-DistributionMap'
	).
]

{ #category : #baseline }
BaselineOfMoose >> baselineGeometry: spec [ 
    
	spec package: 'Geometry'
]

{ #category : #baseline }
BaselineOfMoose >> baselineGrease: spec [ 
   
	self defineGroup: #Grease in: spec with: #(
		'Grease-Core'
		'Grease-Pharo30-Core' 
	).

]

{ #category : #baseline }
BaselineOfMoose >> baselineMagritte3: spec [ 
    
	spec
		package: 'Magritte-Model';
		package: 'Magritte-Pharo3-Model';
		package: 'Magritte-Morph'
]

{ #category : #baseline }
BaselineOfMoose >> baselineMerlin: spec [ 

	self defineGroup: #'Merlin-Group' in: spec with: #(
		'Merlin'
	).
]

{ #category : #baseline }
BaselineOfMoose >> baselineMetanool: spec [ 
    
	spec
		package: 'Metanool-Core';
		package: 'Metanool-Tests-Core'
]

{ #category : #baseline }
BaselineOfMoose >> baselineOrderPreservingDictionary: spec [ 
    
	spec package: 'Collections-OrderPreservingDictionary'
]

{ #category : #baseline }
BaselineOfMoose >> baselinePetitParser: spec [ 
    
	self defineGroup: #'PetitParser-Group' in: spec with: #(
		'PetitParser' 
		'PetitTests' 
		'PetitAnalyzer'
		'PetitGui'
		
		'PetitMSE'
	).

]

{ #category : #baseline }
BaselineOfMoose >> baselineRoassal2: spec [ 
    
	spec
		package: 'Trachel';
		package: 'Roassal2';
		package: 'Roassal2GT'
]

{ #category : #baseline }
BaselineOfMoose >> baselineSmaCC: spec [ 
    
	"
	https://github.com/j-brant/SmaCC
	git@github.com:j-brant/SmaCC.git
	branch: Pharo7
	"

	self defineGroup: #'SmaCC-Group' in: spec with: #(
		'SmaCC_Runtime'
		'SmaCC_GLR_Runtime'
		'SmaCC_Source_Editing'
		'SmaCC_Rewrite_Engine'
		
		'SmaCC_Antlr_Parser'
		'SmaCC_CSV_Parser'
		'SmaCC_CSharp'
		'SmaCC_C_Parser'
		'SmaCC_Delphi'
		'SmaCC_Delphi_Forms'
		'SmaCC_Generic_Smalltalk_Parser'
		'SmaCC_Grammar_Parser'
		'SmaCC_Java'
		'SmaCC_Javascript_Parser'
		'SmaCC_Line_Parser'
		'SmaCC_Smalltalk_Parser'
		'SmaCC_Source_Editing'
		'SmaCC_Swift'

		'SmaCC_Development'
		'SmaCC_Debugging_Support'
		
		'SmaCC_Parse_Tree_Comparison'
		'SmaCC_Tests'
		'SmaCC_Development_UI'
		'SmaCC_Rewrite_Engine_Tests'
		
		'SmaCC_Rewrite_Engine_Command_Line'
		'SmaCC_Rewrite_Engine_UI'
		'SmaCC_Rewrite_Server'
		'SmaCC_Rewrite_Server_Worker'
	).
]

{ #category : #baseline }
BaselineOfMoose >> baselineWizard: spec [ 

	self defineGroup: #'Wizard-Group' in: spec with: #(
		'Moose-Wizard'
	).
]

{ #category : #baseline }
BaselineOfMoose >> baselineXMLParser: spec [ 
    
	spec package: 'XML-Parser'
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
		'Moose-PharoOverrides'

		'Grease'
		'Famix'
	).

	spec group: 'BasicMetamodellingWithRoassal' with: #(
		'BasicMetamodelling'
		'Collections-OrderPreservingDictionary'
		'Collections-BitmapCharacterSet'
		'XML-Parser'		
		'Athens-SVG'
		'Trachel'
		'Geometry'
		'Roassal2'
		'GToolkit-Examples'
		'Roassal2GT'
	).
	
	spec group: 'MooseFinder' with: #(
		'BasicMetamodellingWithRoassal'
		'Glamour-Tools'
		'Magritte-Model'
		'Magritte-Pharo3-Model'
		'Magritte-Morph'
		'Metanool-Core'
		'Metanool-Tests-Core'			
		'Glamour-Magritte-Presentations'
		'MooseAlgos'
		'Moose-RoassalPaintings'
		'Moose-Help'
		'Moose-Finder'
		
		'Moose-Tests-RoassalPaintings'
		'Moose-Tests-Finder'
	).

	spec group: 'Parsing' with: #(
		'MooseFinder'
		'PetitParser-Group'
		'SmaCC-Group'
	).
	
	spec group: 'IDE' with: #(
		'Moose-MenuBar'
		'Moose-Configuration'
	).
	
	spec group: 'AdditionalTools' with: #(
		'Parsing'
		'XMLWriter-Group'
		'Merlin-Group'
		'Moose-DistributionMap'
		'Moose-Tests-DistributionMap'
		'Wizard-Group'
		'IDE'
	).
		
	spec group: 'default' with: #('AdditionalTools').
	

]

{ #category : #dependencies }
BaselineOfMoose >> mooseAlgos: spec [
	spec baseline: 'MooseAlgos' with: [ spec repository: repository ]
]

{ #category : #accessing }
BaselineOfMoose >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]
