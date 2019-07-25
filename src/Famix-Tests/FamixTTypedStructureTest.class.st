Class {
	#name : #FamixTTypedStructureTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTypedStructureTest',
	#classTraits : 'TFamixTTypedStructureTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTypedStructureTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTTypedStructure).
self entity class initializeSlots: self entity.
model add: entity. 
]
