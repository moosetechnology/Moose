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
	generator generate.
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			class
				compile:
					'banana

	^ 42'
				classified: #accessing ]
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
	"[ 'Famix-MetamodelBuilder-Tests-TemporaryResources' asPackage removeFromSystem ] on: NotFound  do: [ ]."
	super tearDown.
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGenerateNoCleaning [
	generator withoutCleaning cleaningStrategy cleanBeforeGeneration: generator.
	self class environment
		at: #FmxTestCleaningStrategyFmxTestEntity
		ifPresent: [ :class | 
			self assert: class methods size equals: 3.
			self assert: (class methods anySatisfy: [ :method | method selector = #banana ]) ]
		ifAbsent: [ self fail ]
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGeneratePartialCleaning [
	self fail
]

{ #category : #running }
FmxMBGeneratorCleaningStrategyTest >> testGenerateTotalCleaning [
	generator withCleaning cleaningStrategy cleanBeforeGeneration: generator.
	self should: [ self class environment at: #FmxTestCleaningStrategyFmxTestEntity ] raise: KeyNotFound  
]
