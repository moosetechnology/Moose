Class {
	#name : #FamixTClassTest,
	#superclass : #TestCase,
	#traits : 'TFamixTClassTest',
	#classTraits : 'TFamixTClassTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTClassTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTClass).
self entity class initializeSlots: self entity.
model add: entity. 
]
