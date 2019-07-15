Class {
	#name : #FmxMBTestingMethodsTest,
	#superclass : #FmxMBTestCase,
	#instVars : [
		'root1',
		'root2',
		'entity',
		'trait',
		'traited',
		'generatedRoot1',
		'generatedRoot2',
		'generatedEntity',
		'generatedTNamed',
		'generatedNamed',
		'traitedRoot',
		'generatedTraitedRoot'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #running }
FmxMBTestingMethodsTest >> setUp [

	super setUp.
	
	root1 := builder newClassNamed: #Root1.	
	root2 := builder newClassNamed: #Root2.	
	entity := builder newClassNamed: #Entity.
	trait := builder newTraitNamed: #TNamed.
	traited := builder newClassNamed: #Named.
	traitedRoot := builder newClassNamed: #TraitedRoot.
	
	root1 <|-- entity.
	root1 <|-- traited.
	trait <|-- traited.
	trait <|-- traitedRoot.
	
	entity withTesting.
	trait withTesting.
	
	builder generate.
	
	generatedRoot1 := builder testingEnvironment ask classNamed: 'TstRoot1'.
	generatedRoot2 := builder testingEnvironment ask classNamed: 'TstRoot2'.
	generatedEntity := builder testingEnvironment ask classNamed: 'TstEntity'.
	generatedTNamed := builder testingEnvironment ask classNamed: 'TstTNamed'.
	generatedNamed := builder testingEnvironment ask classNamed: 'TstNamed'.
	generatedTraitedRoot := builder testingEnvironment ask classNamed: 'TstTraitedRoot'.
	


]

{ #category : #tests }
FmxMBTestingMethodsTest >> testEntity [

	(generatedEntity methodNamed: #isEntity) sourceCode includesSubstring: '^ true'.	
	self assert: (generatedEntity methodNamed: #isNamed) isNil.
]

{ #category : #tests }
FmxMBTestingMethodsTest >> testRoots [

	"all roots should have testing messages with negative answer"

	(generatedRoot1 methodNamed: #isEntity) sourceCode includesSubstring: '^ false'.	
	(generatedRoot1 methodNamed: #isNamed) sourceCode includesSubstring: '^ false'.
	
	(generatedRoot2 methodNamed: #isEntity) sourceCode includesSubstring: '^ false'.	
	(generatedRoot2 methodNamed: #isNamed) sourceCode includesSubstring: '^ false'.
]

{ #category : #tests }
FmxMBTestingMethodsTest >> testTrait [

	"all roots should have testing messages with negative answer"

	(generatedTNamed methodNamed: #isNamed) sourceCode includesSubstring: '^ true'.	
	self assert: (generatedTNamed methodNamed: #isEntity) isNil.
]

{ #category : #tests }
FmxMBTestingMethodsTest >> testTraited [

	self assert: (generatedNamed localMethodNamed: #isNamed ifAbsent: []) isNil.
	self assert: (generatedNamed localMethodNamed: #isEntity ifAbsent: []) isNil.
]

{ #category : #tests }
FmxMBTestingMethodsTest >> testTraitedRoot [

	"a testing method should not be generated if it is provided by a trait"
	
	(generatedTraitedRoot methodNamed: #isEntity) sourceCode includesSubstring: '^ false'.	
	self assert: (generatedTraitedRoot localMethodNamed: #isNamed ifAbsent: [nil]) isNil.
]
