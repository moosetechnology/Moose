Class {
	#name : #FmxMBGeneratorTest,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBGeneratorTest >> testBuilderWithDefinitions [

	builder := FamixTest1Generator builderWithDefinitions.
	self assert: (builder classNamed: #Entity) notNil.
]

{ #category : #tests }
FmxMBGeneratorTest >> testGenerateMooseModelSubclass [

	FamixTest1Generator new generate.
	self assert: ('Famix-Test1-Entities' asPackage definedClasses anySatisfy: [ :c | c superclass = MooseModel]).
	self assert: ('Famix-Test1-Entities' asPackage definedClasses anySatisfy: [ :c | c name = 'FamixTest1Model'])
]

{ #category : #tests }
FmxMBGeneratorTest >> testGeneratorsAreUpToDate [
	FamixMetamodelGenerator individualGenerators
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
	self assert: (metamodel elementNamed: 'Famix-Test1-Entities.Entity' ifAbsent: [ nil ]) notNil
]

{ #category : #tests }
FmxMBGeneratorTest >> testSubmetamodles [

	self assert: FamixMetamodelGenerator submetamodels isEmpty
]
