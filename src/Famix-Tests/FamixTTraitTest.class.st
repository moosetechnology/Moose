Class {
	#name : #FamixTTraitTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTraitTest',
	#classTraits : 'TFamixTTraitTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTraitTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTTrait).
self entity class initializeSlots: self entity.
model add: entity. 
]
