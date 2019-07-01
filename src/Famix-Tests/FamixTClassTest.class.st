Class {
	#name : #FamixTClassTest,
	#superclass : #TestCase,
	#traits : 'TFamixTClassTest + TFamixTWithMethodsTest + TFamixTWithSubInheritancesTest + TFamixTWithSuperInheritancesTest + TFamixTWithAttributesTest',
	#classTraits : 'TFamixTClassTest classTrait + TFamixTWithMethodsTest classTrait + TFamixTWithSubInheritancesTest classTrait + TFamixTWithSuperInheritancesTest classTrait + TFamixTWithAttributesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTClassTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTClass).
self entity class initializeSlots: self entity.
]
