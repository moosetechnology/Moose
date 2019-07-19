Class {
	#name : #FamixTTypeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTypeTest',
	#classTraits : 'TFamixTTypeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTypeTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTType).
self entity class initializeSlots: self entity.
model add: entity. 
]
