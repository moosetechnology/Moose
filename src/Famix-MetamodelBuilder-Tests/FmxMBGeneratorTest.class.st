Class {
	#name : #FmxMBGeneratorTest,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBGeneratorTest >> testBuilderWithDefinitions [
	builder := FamixTest1Generator builderWithDefinitions.
	builder prepareGeneration.
	self assert: (builder classNamed: #Entity) isNotNil
]

{ #category : #tests }
FmxMBGeneratorTest >> testGenerateMooseModelSubclass [

	FamixTest1Generator new generate.
	self assert: ('Famix-Test1-Entities' asPackage definedClasses anySatisfy: [ :c | c superclass = MooseModel]).
	self assert: ('Famix-Test1-Entities' asPackage definedClasses anySatisfy: [ :c | c name = 'FamixTest1Model'])
]

{ #category : #tests }
FmxMBGeneratorTest >> testGeneratorsAreUpToDate [
	FamixMetamodelGenerator generatorsToKeepUpToDate
		do: [ :mm | 
			self
				deny: mm new regenerationIsNeeded
				description: 'The meta-model ' , mm asString , ' is not in sync with its generator. Please, regenerate your MMs with `FamixMetamodelGenerator generateAllMetamodels.' ]
]

{ #category : #tests }
FmxMBGeneratorTest >> testMooseModelSubclassHasMetaModel [
	self assert: FamixTest1Model metamodel isNotNil.
	self deny: MooseModel metamodel equals: FamixTest1Model metamodel
]

{ #category : #tests }
FmxMBGeneratorTest >> testResetMetamodel [
	| metamodel |
	metamodel := FamixTest1Model resetMetamodel.
	self assert: (metamodel elementNamed: 'Famix-Test1-Entities.Entity' ifAbsent: [ nil ]) isNotNil
]

{ #category : #tests }
FmxMBGeneratorTest >> testResetMetamodelSetNewMetamodelToInstances [
	| model oldMetamodel metamodel |
	model := FamixTest1Model new.
	oldMetamodel := model metamodel.
	self assert: model metamodel identicalTo: oldMetamodel.
	metamodel := FamixTest1Model resetMetamodel.
	self deny: model metamodel identicalTo: oldMetamodel.
	self assert: model metamodel identicalTo: metamodel
]

{ #category : #tests }
FmxMBGeneratorTest >> testSubmetamodles [
	self assertEmpty: FamixMetamodelGenerator submetamodels
]
