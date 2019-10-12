Class {
	#name : #FamixTestComposedComposedMetamodels,
	#superclass : #TestCase,
	#category : #'Famix-TestComposedMetamodel'
}

{ #category : #tests }
FamixTestComposedComposedMetamodels >> testModifyMetamodelRecursiveSubmetamodels [
	| customEntity1 |
	customEntity1 := ((FamixTestComposed3Model metamodel at: 'Famix-TestComposedMetamodel-Entities') at: 'CustomEntity1').
	self assert: (customEntity1 at: 'c21') opposite isNotNil.
	self assert: (customEntity1 at: 'customEntity1') opposite isNotNil
]

{ #category : #tests }
FamixTestComposedComposedMetamodels >> testModifyMetamodelSubmetamodels [
	| customEntity1 |
	customEntity1 := ((FamixTestComposedComposedModel metamodel at: 'Famix-TestComposedMetamodel-Entities') at: 'CustomEntity1').
	self assert: (customEntity1 at: 'c21') opposite isNotNil.
	self assert: (customEntity1 at: 'customEntity1') opposite isNotNil.

]
