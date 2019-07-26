Class {
	#name : #FamixMooseModelTest,
	#superclass : #TestCase,
	#traits : 'TFamixMooseModelTest',
	#classTraits : 'TFamixMooseModelTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixMooseModelTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixMooseModel).
self entity class initializeSlots: self entity.
model add: entity. 
]
