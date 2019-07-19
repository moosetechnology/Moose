Class {
	#name : #FamixTWithAttributesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithAttributesTest',
	#classTraits : 'TFamixTWithAttributesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithAttributesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithAttributes).
self entity class initializeSlots: self entity.
model add: entity. 
]
