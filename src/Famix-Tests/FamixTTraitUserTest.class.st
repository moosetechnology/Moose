Class {
	#name : #FamixTTraitUserTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTraitUserTest',
	#classTraits : 'TFamixTTraitUserTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTraitUserTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTTraitUser).
self entity class initializeSlots: self entity.
model add: entity. 
]
