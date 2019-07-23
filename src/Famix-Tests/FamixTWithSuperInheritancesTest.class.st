Class {
	#name : #FamixTWithSuperInheritancesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithSuperInheritancesTest',
	#classTraits : 'TFamixTWithSuperInheritancesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithSuperInheritancesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithSuperInheritances).
self entity class initializeSlots: self entity.
model add: entity. 
]
