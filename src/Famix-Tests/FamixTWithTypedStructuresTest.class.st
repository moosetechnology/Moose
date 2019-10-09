Class {
	#name : #FamixTWithTypedStructuresTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithTypedStructuresTest',
	#classTraits : 'TFamixTWithTypedStructuresTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithTypedStructuresTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithTypedStructures).
self entity class initializeSlots: self entity.
model add: entity. 
]
