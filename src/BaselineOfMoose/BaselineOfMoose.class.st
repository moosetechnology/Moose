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
       
	| repository |

	repository := self packageRepositoryURL.

	spec for: #common do: [ 		
		
		spec package: 'Moose-PharoOverrides'.		
		
		self baselineGrease: spec. 
		self baselineMagritte3: spec.
		self baselineHashtable: spec.
		self baselineStateSpecs: spec.
		self baselineGhost: spec.
		self baselineMocketry: spec.
		self baselineFame: spec.

		spec package: 'GToolkit-Examples'.
		
		self baselineDeepTraverser: spec.
		self baselineRing2: spec.
		
		spec
			package: 'Moose-Query';
			package: 'Moose-Core';
			package: 'Moose-Query-Extensions';
			package: 'Famix-MetamodelBuilder-Core';
			package: 'Famix-MetamodelBuilder-Tests';
			
			package: 'Famix-MetamodelGeneration';
			package: 'Famix-Traits';
				
			package: 'Famix-BasicInfrastructure';
			
			package: 'Famix-Compatibility-Generator';
			package: 'Famix-Compatibility-Entities';
			package: 'Famix-Compatibility-Groups'.

		spec baseline: 'FamixCompatibility' with: [spec repository: repository].
		
		spec
			package: 'Famix-Extensions';
			package: 'Moose-GenericImporter';
			package: 'Famix-Compatibility-Tests-C';
			package: 'Moose-Query-Extensions';
			package: 'Moose-SmalltalkImporter';
			package: 'Moose-MonticelloImporter';
			package: 'Moose-Tests-Core';
			package: 'Famix-Compatibility-Tests-Java';
			package: 'Moose-Tests-SmalltalkImporter-LAN';
			package: 'Moose-Tests-SmalltalkImporter-Core';
			package: 'Moose-Tests-SmalltalkImporter-KGB';
			package: 'Famix-Compatibility-Tests-Core';
			package: 'Famix-Compatibility-Tests-Extensions';
			package: 'Moose-TestResources-Reference-Core';
			package: 'Moose-TestResources-Reference-PackageOne';
			package: 'Moose-TestResources-Reference-PackageTwo';
			package: 'Moose-TestResources-LAN';
			package: 'Moose-TestResources-LCOM';
			package: 'Moose-TestResources-KGB-P4FullInteracted';
			package: 'Moose-TestResources-KGB-P6InteractedReferee';
			package: 'Moose-TestResources-KGB-P5FullReferee';
			package: 'Moose-TestResources-KGB-P1FullReferencer';
			package: 'Moose-TestResources-KGB-P2InteractedReferencerReferee';
			package: 'Moose-TestResources-KGB-P3InteractedReferencer';
			package: 'Moose-TestResources-KGB-P7ReferencerReferee';
			package: 'Moose-TestResources-KGB-P8FullReferencer';
			package: 'Moose-TestResources-KGB-P9FullReferencer';
			package: 'Moose-TestResources-KGB-P10InteractedReferee';
			package: 'Moose-TestResources-KGB-P12FullReferencer';
			package: 'Moose-TestResources-KGB-P11FullReferee';
			package: 'Moose-TestResources-KGB-P13FullReferencer';
			package: 'Moose-TestResources-KGB-P14FullReferee';
			package: 'Moose-TestResources-KGB-PExtensions';
			package: 'Moose-TestResources-PackageBlueprint-P1';
			package: 'Moose-TestResources-PackageBlueprint-P2';
			package: 'Moose-TestResources-PackageBlueprint-P3';
			package: 'Moose-TestResources-PackageBlueprint-P4';
			package: 'Moose-Tests-MonticelloImporter';
			package: 'Moose-Query-Test'.

		self baselineMetamodelBuilder: spec.
		self baselineFamixNG: spec.

		self baselineGeometry: spec.
		self baselineAthens: spec.
		self baselineRoassal2: spec.

		self baselineMooseAlgos: spec.

		self baselineOrderPreservingDictionary: spec.
		self baselineCollectionExtensions: spec.
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

	   self groups: spec.
	]
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
BaselineOfMoose >> baselineCollectionExtensions: spec [ 
    
	self defineGroup: #'CollectionExtensions-Group' in: spec with: #(
		'CollectionExtensions'
	) 
]

{ #category : #baseline }
BaselineOfMoose >> baselineDeepTraverser: spec [ 
    
	self defineGroup: #'DeepTraverser-Base' in: spec with: #(
		 'DeepTraverser'
	).
	
	self defineGroup: #'DeepTraverser-Tests-Group' in: spec with: #(
		 'DeepTraverser-Tests'
	).
]

{ #category : #baseline }
BaselineOfMoose >> baselineFame: spec [ 
    
	self defineGroup: #'Fame' in: spec with: #(
		'Fame-Core'
		'Fame-Util'
		'Fame-ImportExport'
		'Fame-SmalltalkBinding'
		'Fame-Example'
		'Fame-Tests-Core'
	) 
]

{ #category : #baseline }
BaselineOfMoose >> baselineFamixNG: spec [ 
    
	spec
		package: 'Famix-Traits';

		package: 'Famix-PharoSmalltalk-Generator';
		package: 'Famix-PharoSmalltalk-Entities';
		package: 'Famix-PharoSmalltalk-Importer';

		package: 'Famix-Support';

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
BaselineOfMoose >> baselineGhost: spec [ 
    
	self defineGroup: #Ghost in: spec with: #(
		'Ghost-ObjectGhost'
		'Ghost-ClassGhost'
		'Ghost-ObjectMutation'
		'Ghost-ObjectGhost-Tests'
		'Ghost-GTSupport'
		'Ghost-StateSpecsSupport'
		'Ghost-StateSpecsSupport-Tests'
		'Ghost-ClassGhost-Tests'
		'Ghost-ObjectMutation-Tests'
	)
	


]

{ #category : #baseline }
BaselineOfMoose >> baselineGrease: spec [ 
   
	self defineGroup: #Grease in: spec with: #(
		'Grease-Core'
		'Grease-Pharo30-Core' 
	).

]

{ #category : #baseline }
BaselineOfMoose >> baselineHashtable: spec [ 
    
	self defineGroup: #'HashTable-Group' in: spec with: #(
		'Hashtable'
	) 
]

{ #category : #baseline }
BaselineOfMoose >> baselineMagritte3: spec [ 
    
	spec
		package: 'Magritte-Model';
		package: 'Magritte-Pharo3-Model';
		package: 'Magritte-Morph'
]

{ #category : #baseline }
BaselineOfMoose >> baselineMetamodelBuilder: spec [ 
    
	spec package: 'Famix-MetamodelBuilder-Core'
]

{ #category : #baseline }
BaselineOfMoose >> baselineMetanool: spec [ 
    
	spec
		package: 'Metanool-Core';
		package: 'Metanool-Tests-Core'
]

{ #category : #baseline }
BaselineOfMoose >> baselineMocketry: spec [ 
    
	self defineGroup: #Mocketry in: spec with: #(
		'Mocketry-Specs'
		'Mocketry-Domain'
		'Mocketry-Help'
		'Mocketry-Specs-Tests'
		'Mocketry-Domain-Tests'
	)
]

{ #category : #baseline }
BaselineOfMoose >> baselineMooseAlgos: spec [ 
    
	spec
		package: 'Moose-Tests-Algos-Graph';
		package: 'Moose-Tests-Algos-InformationRetrieval';
		package: 'Moose-Algos-FormalConceptAnalysis';
		package: 'Moose-Tests-Algos-FormalConceptAnalysis';
		package: 'Moose-Algos-Lattice';
		package: 'Moose-Tests-Algos-Lattice';
		package: 'Moose-Algos-LinearAlgebra';
		package: 'Moose-Tests-Algos-LinearAlgebra';
		package: 'Moose-Algos-InformationRetrieval'
]

{ #category : #baseline }
BaselineOfMoose >> baselineMooseTestResources: spec [ 
    
	self defineGroup: #MooseTestResources in: spec with: #(
		'Moose-TestResources-LAN'
		'Moose-TestResources-Reference-Core'
		'Moose-TestResources-KGB-P4FullInteracted'
		'Moose-TestResources-KGB-P6InteractedReferee'
		'Moose-TestResources-KGB-P5FullReferee'
		'Moose-TestResources-KGB-P7ReferencerReferee'
		'Moose-TestResources-KGB-P2InteractedReferencerReferee'
		'Moose-TestResources-KGB-P1FullReferencer'
		'Moose-TestResources-KGB-P3InteractedReferencer'
		'Moose-TestResources-KGB-P8FullReferencer'
		'Moose-TestResources-KGB-P9FullReferencer'
		'Moose-TestResources-KGB-P10InteractedReferee'
		'Moose-TestResources-KGB-P11FullReferee'
		'Moose-TestResources-KGB-P12FullReferencer'
		'Moose-TestResources-KGB-P13FullReferencer'
		'Moose-TestResources-KGB-P14FullReferee'
		'Moose-TestResources-LCOM'
		'Moose-TestResources-PackageBlueprint-P1'
		'Moose-TestResources-PackageBlueprint-P2'
		'Moose-TestResources-PackageBlueprint-P3'
		'Moose-TestResources-PackageBlueprint-P4'
		'Moose-TestResources-Reference-PackageOne'
		'Moose-Tests-SmalltalkImporter-Core'
		'Moose-TestResources-Reference-PackageTwo'
		'Moose-Tests-SmalltalkImporter-LAN'
		'Moose-Tests-SmalltalkImporter-KGB'
		'Moose-TestResources-KGB-PExtensions'
	).

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
	).

]

{ #category : #baseline }
BaselineOfMoose >> baselineRing2: spec [ 
    
	self defineGroup: #Ring2 in: spec with: #(
		'Ring2-Core' 
		'Ring2-TraitsV2Support'
		'Ring2-Monticello' 
		'Ring2-ChunkImporter'
		'Ring2-Tests-Core' 
		'Ring2-Tests-Monticello' 
		'Ring2-Tests-ChunkImporter' 
		'Ring2-RuntimeSupport' 
		'Calypso-Ring2').

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
BaselineOfMoose >> baselineStateSpecs: spec [ 
    
	self defineGroup: #'StateSpecs-Base' in: spec with: #(
		'StateSpecs-Specs'
		'StateSpecs-DSL-ShouldExpressions'
	).

	self defineGroup: #'StateSpecs-Additional' in: spec with: #(
		'StateSpecs-DSL-ClassWords'
		'StateSpecs-Help'
		'StateSpecs-Specs-Tests'
		'StateSpecs-DSL-ShouldExpressions-Tests'
		'StateSpecs-DSL-ClassWords-Tests'
	)
]

{ #category : #baseline }
BaselineOfMoose >> baselineXMLParser: spec [ 
    
	spec package: 'XML-Parser'
]

{ #category : #private }
BaselineOfMoose >> defineGroup: groupName in: spec with: packages [

	packages do: [ :packageName | spec package: packageName ].
	spec group: groupName with: packages
]

{ #category : #baseline }
BaselineOfMoose >> groups: spec [ 
    
	spec group: 'BasicMetamodelling' with: #(
		'Moose-PharoOverrides'

		'Ring2' 
		'Grease' 
		'CollectionExtensions-Group'
		'HashTable-Group'
		'StateSpecs-Base'
		'Fame'
		'DeepTraverser-Base'

		'Moose-Core'
		'Moose-Query'
			
		'Famix-BasicInfrastructure'
		'Famix-Support'

		'Famix-MetamodelBuilder-Core'
			
		'Moose-Query-Extensions'
		'Moose-Query-Test'
		'Moose-GenericImporter'
			
		'Famix-MetamodelGeneration'
		'Famix-Traits'
			
		'Famix-Compatibility-Generator' 
		'Famix-Compatibility-Entities'
		'Famix-Compatibility-Groups'
			
		'Famix-Extensions'
	).
	
	spec group: 'BasicTests' with: #(
		'Famix-MetamodelBuilder-Tests'

		'StateSpecs-Additional'
		'Ghost'
		'Mocketry'
			
		'Moose-TestResources-LAN'
		'Moose-TestResources-Reference-Core'
		'Moose-TestResources-KGB-P4FullInteracted'
		'Moose-TestResources-KGB-P6InteractedReferee'
		'Moose-TestResources-KGB-P5FullReferee'
		'Moose-TestResources-KGB-P7ReferencerReferee'
		'Moose-TestResources-KGB-P2InteractedReferencerReferee'
		'Moose-TestResources-KGB-P1FullReferencer'
		'Moose-TestResources-KGB-P3InteractedReferencer'
		'Moose-TestResources-KGB-P8FullReferencer'
		'Moose-TestResources-KGB-P9FullReferencer'
		'Moose-TestResources-KGB-P10InteractedReferee'
		'Moose-TestResources-KGB-P11FullReferee'
		'Moose-TestResources-KGB-P12FullReferencer'
		'Moose-TestResources-KGB-P13FullReferencer'
		'Moose-TestResources-KGB-P14FullReferee'
		'Moose-TestResources-LCOM'
		'Moose-TestResources-PackageBlueprint-P1'
		'Moose-TestResources-PackageBlueprint-P2'
		'Moose-TestResources-PackageBlueprint-P3'
		'Moose-TestResources-PackageBlueprint-P4'
		'Moose-TestResources-Reference-PackageOne'
		'Moose-Tests-SmalltalkImporter-Core'
		'Moose-TestResources-Reference-PackageTwo'
		'Moose-Tests-SmalltalkImporter-LAN'
		'Moose-Tests-SmalltalkImporter-KGB'
		'Moose-TestResources-KGB-PExtensions'
			
		'Moose-GenericImporter'
		'Moose-SmalltalkImporter'
		'Moose-Tests-Core'
		'Famix-Compatibility-Tests-Core'
		'Famix-Compatibility-Tests-C'
		'Famix-Compatibility-Tests-Java'
		'Famix-Compatibility-Tests-Extensions'
		'DeepTraverser-Tests-Group'
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
		'Moose-Algos-Lattice'
		'Moose-Tests-Algos-Graph'
		'Moose-Algos-FormalConceptAnalysis'
		'Moose-Algos-InformationRetrieval'
		'Moose-Algos-LinearAlgebra'
		'Moose-Tests-Algos-FormalConceptAnalysis'
		'Moose-Tests-Algos-LinearAlgebra'
		'Moose-RoassalPaintings'
		'Moose-Help'
		'Moose-Finder'
		
		'Moose-Tests-RoassalPaintings'
		'Moose-Tests-Finder'
		'Moose-Tests-Algos-Lattice'
		'Moose-Tests-Algos-InformationRetrieval'

		'Moose-MonticelloImporter'
		'Moose-Tests-MonticelloImporter'
		
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
		
	spec group: 'default' with: #('Parsing').
	

]
