Class {
	#name : #FmxMBGeneratorCleaningStrategyTest,
	#superclass : #FmxMBTestCase,
	#instVars : [
		'mooseClass',
		'generatorClass',
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
			class setTraitComposition: class traitComposition + FamixTestExternalTraits ]
		ifAbsent: [ self fail ]
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
	generator withoutCleaning cleaningStrategy cleanBeforeGeneration: generator.
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			self assert: (class class methods anySatisfy: [ :method | method selector = #tree ]).
			self assert: (class methods anySatisfy: [ :method | method selector = #banana ]).
			self assert: (class methods anySatisfy: [ :method | method selector = #potatoExtendedMethod ]).
			self assert: (class methods detect: [ :method | method selector = #potatoExtendedMethod ]) protocol equals: (#* , self class package name).
			self assert: (class traitComposition allTraits anySatisfy: [ :trait | trait name = #FamixTestExternalTraits ]). ]
		
		ifAbsent: [ self fail ]
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGenerateNoCleaningGeneration [
	generator generateWithoutCleaning.
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			self assert: (class class methods anySatisfy: [ :method | method selector = #tree ]).
			self assert: (class methods anySatisfy: [ :method | method selector = #banana ]).
			self assert: (class methods anySatisfy: [ :method | method selector = #potatoExtendedMethod ]).
			self assert: (class methods detect: [ :method | method selector = #potatoExtendedMethod ]) protocol equals: (#* , self class package name).
			self assert: (class traitComposition allTraits anySatisfy: [ :trait | trait name = #FamixTestExternalTraits ]).
			 ]
		ifAbsent: [ self fail ]
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGeneratePartialCleaningCleaning [
	generator withPartialCleaning cleaningStrategy cleanBeforeGeneration: generator.
	self should: [ self class environment at: #FmxTestCleaningStrategyFmxTestEntity ] raise: KeyNotFound
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGeneratePartialCleaningGeneration [
	generator generateWithPartialCleaning.

	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			self assert: (class class methods anySatisfy: [ :method | method selector = #tree ]).
			self assert: (class class methods detect: [ :method | method selector = #tree ]) protocol equals: 'monkey'.
			self assert: (class methods anySatisfy: [ :method | method selector = #banana ]).
			self assert: (class methods detect: [ :method | method selector = #banana ]) protocol equals: 'monkey'.
			self assert: (class methods anySatisfy: [ :method | method selector = #potatoExtendedMethod ]).
			self assert: (class methods detect: [ :method | method selector = #potatoExtendedMethod ]) protocol equals: (#* , self class package name).
			self assert: (class traitComposition allTraits anySatisfy: [ :trait | trait name = #FamixTestExternalTraits ]). ]
		ifAbsent: [ self fail ]
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGenerateTotalCleaningCleaning [
	generator withCleaning cleaningStrategy cleanBeforeGeneration: generator.
	self should: [ self class environment at: #FmxTestCleaningStrategyFmxTestEntity ] raise: KeyNotFound  
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGenerateTotalCleaningGeneration [
	generator generateWithCleaning.
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class |
			self assert: (class class methods noneSatisfy: [ :method | method selector = #tree ]). 
			self assert: (class methods noneSatisfy: [ :method | method selector = #banana ]).
			self assert: (class methods noneSatisfy: [ :method | method selector = #potatoExtendedMethod ]).
			self assert: (class traitComposition allTraits noneSatisfy: [ :trait | trait name = #FamixTestExternalTraits ]).  ]
		ifAbsent: [ self fail ]
]
