Class {
	#name : #FamixTestComposedComposedMetamodels,
	#superclass : #TestCase,
	#category : #'Famix-TestComposedMetamodel'
}

{ #category : #tests }
FamixTestComposedComposedMetamodels >> testModifyMetamodelRecursiveSubmetamodels [
	| customEntity1 |
	customEntity1 := (FamixTestComposed3Model metamodel packageNamed: 'Famix-TestComposedMetamodel-Entities') classNamed: 'CustomEntity1'.
	self assert: (customEntity1 propertyNamed: 'c21') opposite isNotNil.
	self assert: (customEntity1 propertyNamed: 'customEntity1') opposite isNotNil
]

{ #category : #tests }
FamixTestComposedComposedMetamodels >> testModifyMetamodelSubmetamodels [
	| customEntity1 |
	customEntity1 := (FamixTestComposedComposedModel metamodel packageNamed: 'Famix-TestComposedMetamodel-Entities') classNamed: 'CustomEntity1'.
	self assert: (customEntity1 propertyNamed: 'c21') opposite isNotNil.
	self assert: (customEntity1 propertyNamed: 'customEntity1') opposite isNotNil
]
