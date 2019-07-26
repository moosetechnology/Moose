Class {
	#name : #FamixTSourceEntityTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSourceEntityTest + TFamixTWithSourceAnchorTest + TFamixTWithSourceLanguageTest',
	#classTraits : 'TFamixTSourceEntityTest classTrait + TFamixTWithSourceAnchorTest classTrait + TFamixTWithSourceLanguageTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTSourceEntityTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTSourceEntity).
self entity class initializeSlots: self entity.
model add: entity. 
]
