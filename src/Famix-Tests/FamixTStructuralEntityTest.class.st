Class {
	#name : #FamixTStructuralEntityTest,
	#superclass : #TestCase,
	#traits : 'TFamixTStructuralEntityTest',
	#classTraits : 'TFamixTStructuralEntityTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTStructuralEntityTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTStructuralEntity).
self entity class initializeSlots: self entity.
model add: entity. 
]
