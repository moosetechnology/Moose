Class {
	#name : #FamixTInheritanceTest,
	#superclass : #TestCase,
	#traits : 'TFamixTInheritanceTest',
	#classTraits : 'TFamixTInheritanceTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTInheritanceTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTInheritance).
self entity class initializeSlots: self entity.
model add: entity. 
]
