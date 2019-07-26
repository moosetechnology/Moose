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
	self assert: ('Famix-Test1-Entities' asPackage definedClasses anySatisfy: [ :c | c name = 'FamixTest1MooseModel'])
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
FmxMBGeneratorTest >> testMooseModelSubclassHasInitialize [
	| mooseModel |
	FamixTest1Generator new generate.
	mooseModel := 'FamixTest1MooseModel' asClass.
	self
		assert: (mooseModel methods anySatisfy: [ :m | m selector = 'initialize' ])
]

{ #category : #tests }
FmxMBGeneratorTest >> testMooseModelSubclassHasMetaModel [
	| mooseModel |
	FamixTest1Generator new generate.
	mooseModel := 'FamixTest1MooseModel' asClass new.
	self
		assert: mooseModel metamodel
		equals: FamixTest1Generator metamodel
]

{ #category : #tests }
FmxMBGeneratorTest >> testNewRepository [

	| repository |
	
	repository := FamixTest1Generator newRepository.
	self assert: repository isEmpty.	
	self deny: repository metamodel elements isEmpty.
]

{ #category : #tests }
FmxMBGeneratorTest >> testResetMetamodel [
	
	| metamodel |
	
	metamodel := FamixTest1Generator resetMetamodel.
	self assert: (metamodel elementNamed: 'Famix-Test1-Entities.Entity' ifAbsent: [nil]) notNil.
]

{ #category : #tests }
FmxMBGeneratorTest >> testSubmetamodles [

	self assert: FamixMetamodelGenerator submetamodels isEmpty
]
