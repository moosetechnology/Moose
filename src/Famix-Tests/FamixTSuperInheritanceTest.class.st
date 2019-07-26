Class {
	#name : #FamixTSuperInheritanceTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSuperInheritanceTest',
	#classTraits : 'TFamixTSuperInheritanceTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTSuperInheritanceTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTSuperInheritance).
self entity class initializeSlots: self entity.
model add: entity. 
]
