Class {
	#name : #FamixTWithSubInheritancesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithSubInheritancesTest',
	#classTraits : 'TFamixTWithSubInheritancesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithSubInheritancesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithSubInheritances).
self entity class initializeSlots: self entity.
model add: entity. 
]
