Class {
	#name : #FmxMBConfigurationTest,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBConfigurationTest >> testConfiguration [

	| config | 
	
	config := builder configuration.
	
	self assert: config notNil.
	
	self assert: config basicSuperclassName equals: config defaultBasicSuperclassName.
	config basicSuperclassName: #TestValue1.
	self assert: config basicSuperclassName equals: #TestValue1.

	self assert: config basicTraitName equals: config defaultBasicTraitName.
	config basicTraitName: #TestValue2.
	self assert: config basicTraitName equals: #TestValue2.

	self assert: config classTag equals: config defaultClassTag.
	config classTag: #TestValue3.
	self assert: config classTag equals: #TestValue3.

	self assert: config navigationForContainers.
	config navigationForContainers: false.
	self deny: config navigationForContainers.

	self deny: config navigationForNonContainers.
	config navigationForNonContainers: true.
	self assert: config navigationForNonContainers.

	self deny: config wantsToGenerateImportingContext.
	config wantsToGenerateImportingContext: true.
	self assert: config wantsToGenerateImportingContext.

]
