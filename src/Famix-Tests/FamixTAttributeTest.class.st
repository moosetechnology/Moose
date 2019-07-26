Class {
	#name : #FamixTAttributeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTAttributeTest',
	#classTraits : 'TFamixTAttributeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTAttributeTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTAttribute).
self entity class initializeSlots: self entity.
model add: entity. 
]
