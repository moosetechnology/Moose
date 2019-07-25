Class {
	#name : #FamixTWithTypesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithTypesTest',
	#classTraits : 'TFamixTWithTypesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithTypesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithTypes).
self entity class initializeSlots: self entity.
model add: entity. 
]
