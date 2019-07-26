Class {
	#name : #FamixTWithModifiersTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithModifiersTest',
	#classTraits : 'TFamixTWithModifiersTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithModifiersTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithModifiers).
self entity class initializeSlots: self entity.
model add: entity. 
]
