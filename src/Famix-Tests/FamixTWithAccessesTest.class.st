Class {
	#name : #FamixTWithAccessesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithAccessesTest',
	#classTraits : 'TFamixTWithAccessesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithAccessesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithAccesses).
self entity class initializeSlots: self entity.
model add: entity. 
]
