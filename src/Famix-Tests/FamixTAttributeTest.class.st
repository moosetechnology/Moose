Class {
	#name : #FamixTAttributeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTAttributeTest + TFamixTest + TFamixTWithModifiersTest + TFamixTStructuralEntityTest',
	#classTraits : 'TFamixTAttributeTest classTrait + TFamixTest classTrait + TFamixTWithModifiersTest classTrait + TFamixTStructuralEntityTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTAttributeTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTAttribute).
self entity class initializeSlots: self entity.
model add: entity. 
]
