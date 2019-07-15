Class {
	#name : #FmxMBGeneratorCleaningStrategyTest,
	#superclass : #FmxMBTestCase,
	#instVars : [
		'generator'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> generateClasses [
	FamixMetamodelCleaningStrategiesTestGenerator new generate.
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			class
				compile:
					'banana

	^ 42'
				classified: #monkey.
			class class
				compile:
					'tree

	^ #Christopher'
				classified: #monkey.
			class
				compile:
					'potatoExtendedMethod

	^ 42'
				classified: #* , self class package name.
			class addToComposition: FamixTestExternalTraits.
			class addInstVarNamed: 'bananaTree'.
			class addClassVarNamed: 'Fuhrmanator'.
			class class addInstVarNamed: 'grandFrais' ]
		ifAbsent: [ self fail ].
	Object
		subclass: #FmxCleanerTestAddedClass
		slots: {}
		classVariables: {}
		package: self packageName.
	Trait named: #TFmxCleanerTestAddedTrait uses: {} package: self packageName.
	self class compile: 'extensionsMethodForTest' classified: ('*' , generator packageName)
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> packageName [
	^ 'Famix-MetamodelBuilder-TestsResources'
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> setUp [
	super setUp.
	generator := FamixMetamodelCleaningStrategiesTestGenerator new.
	self generateClasses
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> tearDown [
	[ self packageName asPackage removeFromSystem ] on: NotFound  do: [ ].
	super tearDown.
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGenerateNoCleaningCleaning [
	generator define.
	generator withoutCleaning cleaningStrategy cleanBeforeGeneration: generator.
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			self assert: (class class localMethods anySatisfy: [ :method | method selector = #tree ]).
			self assert: (class localMethods anySatisfy: [ :method | method selector = #banana ]).
			self assert: (class localMethods anySatisfy: [ :method | method selector = #potatoExtendedMethod ]).
			self assert: (class localMethods detect: [ :method | method selector = #potatoExtendedMethod ]) protocol equals: #* , self class package name.
			self assert: (class traitComposition allTraits anySatisfy: [ :trait | trait name = #FamixTestExternalTraits ]).
			self assert: (class hasInstVarNamed: #bananaTree).
			self assert: (class hasClassVarNamed: #Fuhrmanator).
			self assert: (class class hasInstVarNamed: #grandFrais) ]
		ifAbsent: [ self fail ].

	self assert: (self class methodDict at: #extensionsMethodForTest ifPresent: [ true ] ifAbsent: [ false ]).

	self class environment at: #FmxCleanerTestAddedClass ifPresent: [ :class | self assert: class package name equals: self packageName ] ifAbsent: [ self fail ].
	self class environment at: #TFmxCleanerTestAddedTrait ifPresent: [ :class | self assert: class package name equals: self packageName ] ifAbsent: [ self fail ]
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGenerateNoCleaningGeneration [
	generator generateWithoutCleaning.

	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			self assert: (class class localMethods anySatisfy: [ :method | method selector = #tree ]).
			self assert: (class class localMethods detect: [ :method | method selector = #tree ]) protocol equals: 'monkey'.
			self assert: (class localMethods anySatisfy: [ :method | method selector = #banana ]).
			self assert: (class localMethods detect: [ :method | method selector = #banana ]) protocol equals: 'monkey'.
			self assert: (class localMethods anySatisfy: [ :method | method selector = #potatoExtendedMethod ]).
			self assert: (class localMethods detect: [ :method | method selector = #potatoExtendedMethod ]) protocol equals: #* , self class package name.
			self assert: (class traitComposition allTraits anySatisfy: [ :trait | trait name = #FamixTestExternalTraits ]).
			self assert: (class hasInstVarNamed: #bananaTree).
			self assert: (class hasClassVarNamed: #Fuhrmanator).
			self assert: (class class hasInstVarNamed: #grandFrais) ]
		ifAbsent: [ self fail ].

	self assert: (self class methodDict at: #extensionsMethodForTest ifPresent: [ true ] ifAbsent: [ false ]).

	self class environment at: #FmxCleanerTestAddedClass ifPresent: [ :class | self assert: class package name equals: self packageName ] ifAbsent: [ self fail ].
	self class environment at: #TFmxCleanerTestAddedTrait ifPresent: [ :class | self assert: class package name equals: self packageName ] ifAbsent: [ self fail ]
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGenerateTotalCleaningCleaning [
	generator define.
	generator withCleaning cleaningStrategy cleanBeforeGeneration: generator.
	self should: [ self class environment at: #FmxTestCleaningStrategyFmxTestEntity ] raise: KeyNotFound.
	self should: [ self class environment at: #FmxCleanerTestAddedClass ] raise: KeyNotFound.
	self should: [ self class environment at: #TFmxCleanerTestAddedTrait ] raise: KeyNotFound.
	self assert: (self class methodDict at: #extensionsMethodForTest ifPresent: [ false ] ifAbsent: [ true ])
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGenerateTotalCleaningGeneration [
	generator generateWithCleaning.
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			self assert: (class class localMethods noneSatisfy: [ :method | method selector = #tree ]).
			self assert: (class localMethods noneSatisfy: [ :method | method selector = #banana ]).
			self assert: (class localMethods noneSatisfy: [ :method | method selector = #potatoExtendedMethod ]).
			self assert: (class traitComposition allTraits noneSatisfy: [ :trait | trait name = #FamixTestExternalTraits ]).
			self deny: (class hasInstVarNamed: #bananaTree).
			self deny: (class hasClassVarNamed: #Fuhrmanator).
			self deny: (class class hasInstVarNamed: #grandFrais) ]
		ifAbsent: [ self fail ].
	
	self assert: (self class methodDict at: #extensionsMethodForTest ifPresent: [ false ] ifAbsent: [ true ]).

	self should: [ self class environment at: #FmxCleanerTestAddedClass ] raise: KeyNotFound.
	self should: [ self class environment at: #TFmxCleanerTestAddedTrait ] raise: KeyNotFound
]
