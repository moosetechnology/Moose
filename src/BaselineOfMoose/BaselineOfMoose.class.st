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
		for: #'pharo7.x'
		do: [ self baselineRing2ForPharo7: spec.
			self commonBaselineSpec: spec.

			spec
				package: 'Famix-MetamodelBuilder-Core' with: [ spec includes: #('Famix-MetamodelBuilder-Core-Pharo7') ];
				package: 'Famix-MetamodelBuilder-Core-Pharo7' ].

	spec
		for: #'pharo8.x'
		do: [ self baselineRing2: spec.
			self commonBaselineSpec: spec.
			spec package: 'Roassal2GT' with: [ spec includes: #('Glamour-Browsers-Pharo8' 'Glamour-Morphic-Renderer-Pharo8') ].
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
BaselineOfMoose >> baselineFamixNG: spec [ 
    
	spec
		package: 'Famix-Traits';

		package: 'Famix-PharoSmalltalk-Generator';
		package: 'Famix-PharoSmalltalk-Entities';
		package: 'Famix-PharoSmalltalk-Importer';

		package: 'Famix-Java-Generator';
		package: 'Famix-Java-Entities';

		package: 'Famix-TestGenerators';
		package: 'Famix-Test1-Entities';
		package: 'Famix-Test1-Tests';
		package: 'Famix-Test2-Entities';
		package: 'Famix-Test2-Tests';
		package: 'Famix-Test3-Entities';
		package: 'Famix-Test3-Tests';
		package: 'Famix-Test4-Entities';
		package: 'Famix-Test4-Tests';
		package: 'Famix-TestComposedSubmetamodel1-Entities';
		package: 'Famix-TestComposedSubmetamodel2-Entities';
		package: 'Famix-TestComposedMetamodel';
		package: 'Famix-TestComposedMetamodel-Entities'.
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
BaselineOfMoose >> baselineMetamodelBuilder: spec [ 
    
	spec package: 'Famix-MetamodelBuilder-Core'.
]

{ #category : #baseline }
BaselineOfMoose >> baselineMetanool: spec [ 
    
	spec
		package: 'Metanool-Core';
		package: 'Metanool-Tests-Core'
]

{ #category : #baseline }
BaselineOfMoose >> baselineNeoCSV: spec [ 
    
	self defineGroup: #'NeoCSV-Group' in: spec with: #(
		'Neo-CSV-Core' 
		'Neo-CSV-Tests' 
	).

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
BaselineOfMoose >> baselineRing2: spec [
	spec
		baseline: 'Ring2'
		with: [ spec
				loads: 'runtimeSupport';
				repository: 'github://pavel-krivanek/Ring2:RGPackageRenamed/src' ]
]

{ #category : #baseline }
BaselineOfMoose >> baselineRing2ForPharo7: spec [
	spec
		baseline: 'Ring2'
		with: [ spec
				loads: 'runtimeSupport';
				repository: 'github://pavel-krivanek/Ring2:v1.2.0/src' ]
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

{ #category : #baseline }
BaselineOfMoose >> commonBaselineSpec: spec [
	spec package: 'Moose-PharoOverrides'.
	self baselineGrease: spec.
	self baselineMagritte3: spec.

	self fame: spec.

	spec package: 'GToolkit-Examples'.
	
	self deepTraverser: spec.
	
	spec
		package: 'Moose-Query';
		package: 'Moose-Core';
		package: 'Moose-Query-Extensions';
		package: 'Famix-MetamodelBuilder-Core' with: [ spec requires: #('Ring2') ];
		package: 'Famix-MetamodelBuilder-Tests';
		package: 'Famix-MetamodelGeneration';
		package: 'Famix-Groups';
		package: 'Famix-Groups-Tests';
		package: 'Famix-Traits';
		package: 'Famix-BasicInfrastructure';
		package: 'Famix-Smalltalk-Utils';
		package: 'Famix-Compatibility-Generator';
		package: 'Famix-Compatibility-Entities'.
	spec baseline: 'FamixCompatibility' with: [ spec repository: repository ].

	self roelTyper: spec.

	spec
		package: 'Moose-GenericImporter';
		package: 'Famix-Compatibility-Tests-C';
		package: 'Moose-Query-Extensions';
		package: 'Moose-SmalltalkImporter';
		package: 'Moose-MonticelloImporter';
		package: 'Moose-Tests-Core';
		package: 'Famix-Smalltalk-Utils-Tests';
		package: 'Famix-Compatibility-Tests-Java';
		package: 'Moose-Tests-SmalltalkImporter-LAN';
		package: 'Moose-Tests-SmalltalkImporter-Core';
		package: 'Moose-Tests-SmalltalkImporter-KGB';
		package: 'Famix-Compatibility-Tests-Core';
		package: 'Famix-Compatibility-Tests-Extensions';
		package: 'Moose-TestResources-LAN';
		package: 'Moose-TestResources-LCOM'.
		
	self
		referenceTestResources: spec;
		kgbTestResources: spec;
		packageBlueprintTestResources: spec.
		
	spec
		package: 'Moose-Tests-MonticelloImporter';
		package: 'Moose-Query-Test'.
	self baselineMetamodelBuilder: spec.
	self baselineFamixNG: spec.
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
	self baselineNeoCSV: spec.
	self baselineSmaCC: spec.
	self baselineXMLWriter: spec.
	self baselineMerlin: spec.
	self baselineDistributionMap: spec.
	self baselineWizard: spec.
	spec package: 'Moose-MenuBar'.
	^ self groups: spec
]

{ #category : #dependencies }
BaselineOfMoose >> deepTraverser: spec [
	spec baseline: 'DeepTraverser' with: [ spec repository: repository ]
]

{ #category : #private }
BaselineOfMoose >> defineGroup: groupName in: spec with: packages [

	packages do: [ :packageName | spec package: packageName ].
	spec group: groupName with: packages
]

{ #category : #dependencies }
BaselineOfMoose >> fame: spec [
	spec baseline: 'Fame' with: [ spec repository: repository ]
]

{ #category : #baseline }
BaselineOfMoose >> groups: spec [ 
    
	spec group: 'BasicMetamodelling' with: #(
		'Moose-PharoOverrides'

		'Ring2' 
		'Grease' 
		'Fame'
		'DeepTraverser'

		'Moose-Core'
		'Moose-Query'
			
		'Famix-BasicInfrastructure'
		'Famix-MetamodelBuilder-Core'
			
		'Moose-Query-Extensions'
		'Moose-Query-Test'
		'Moose-GenericImporter'
			
		'Famix-MetamodelGeneration'
		'Famix-Traits'
		
		'Famix-Smalltalk-Utils'
		'Famix-Groups'
		'Famix-Compatibility-Generator' 
		'Famix-Compatibility-Entities'
	).
	
	spec group: 'BasicTests' with: #(
		'Famix-MetamodelBuilder-Tests'
		'Famix-Smalltalk-Utils-Tests'
		'Famix-Groups-Tests'
			
		'Moose-TestResources-LAN'
		'ReferenceTestResources'
		'KGBTestResources'
		'Moose-TestResources-LCOM'
		'PackageBlueprintTestResources'
		'Moose-Tests-SmalltalkImporter-Core'
		'Moose-Tests-SmalltalkImporter-LAN'
		'Moose-Tests-SmalltalkImporter-KGB'
		
		'RoelTyper'
		'Moose-GenericImporter'
		'Moose-SmalltalkImporter'
		'Moose-Tests-Core'
		'Famix-Compatibility-Tests-Core'
		'Famix-Compatibility-Tests-C'
		'Famix-Compatibility-Tests-Java'
		'Famix-Compatibility-Tests-Extensions'
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
		'BasicTests'
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
		
		'Famix-PharoSmalltalk-Generator'
		'Famix-PharoSmalltalk-Entities'
		'Famix-PharoSmalltalk-Importer'
		
		'Famix-Java-Generator'
		'Famix-Java-Entities'
		
		'Famix-TestGenerators'
		'Famix-Test1-Entities'
		'Famix-Test1-Tests'
		'Famix-Test2-Entities'
		'Famix-Test2-Tests'
		'Famix-Test3-Entities'
		'Famix-Test3-Tests'
		'Famix-Test4-Entities'
		'Famix-Test4-Tests'
		'Famix-TestComposedMetamodel'
		'Famix-TestComposedMetamodel-Entities'
		'Famix-TestComposedSubmetamodel1-Entities'
		'Famix-TestComposedSubmetamodel2-Entities'
	).

	spec group: 'Parsing' with: #(
		'MooseFinder'
		'PetitParser-Group'
		'NeoCSV-Group'
		'SmaCC-Group'
	).
	
	spec group: 'IDE' with: #(
		'Moose-MenuBar'
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
BaselineOfMoose >> kgbTestResources: spec [
	spec baseline: 'KGBTestResources' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfMoose >> mooseAlgos: spec [
	spec baseline: 'MooseAlgos' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfMoose >> packageBlueprintTestResources: spec [
	spec baseline: 'PackageBlueprintTestResources' with: [ spec repository: repository ]
]

{ #category : #accessing }
BaselineOfMoose >> packageRepositoryURL [
	^ super packageRepositoryURL
		ifEmpty: [ | packageName |
			packageName := self class package name.
			'tonel://' , (IceRepository registry detect: [ :repo | repo workingCopy packageNames includes: packageName ] ifFound: [ :repo | repo location pathString , '/' , repo subdirectory ] ifNone: [ '' ]) ]
]

{ #category : #dependencies }
BaselineOfMoose >> referenceTestResources: spec [
	spec baseline: 'ReferenceTestResources' with: [ spec repository: repository ]
]

{ #category : #dependencies }
BaselineOfMoose >> roelTyper: spec [
	spec baseline: 'RoelTyper' with: [ spec repository: repository ]
]
