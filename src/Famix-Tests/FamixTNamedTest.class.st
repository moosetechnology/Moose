Class {
	#name : #FamixTNamedTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSourceEntityTest + TFamixTest + TFamixTNamedTest',
	#classTraits : 'TFamixTSourceEntityTest classTrait + TFamixTest classTrait + TFamixTNamedTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTNamedTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTNamed).
self entity class initializeSlots: self entity.
model add: entity. 
]
