Class {
	#name : #FamixTWithClassesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithClassesTest',
	#classTraits : 'TFamixTWithClassesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithClassesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithClasses).
self entity class initializeSlots: self entity.
model add: entity. 
]
