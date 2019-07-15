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
