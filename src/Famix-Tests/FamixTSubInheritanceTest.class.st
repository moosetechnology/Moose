Class {
	#name : #FamixTSubInheritanceTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSubInheritanceTest',
	#classTraits : 'TFamixTSubInheritanceTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTSubInheritanceTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTSubInheritance).
self entity class initializeSlots: self entity.
model add: entity. 
]
