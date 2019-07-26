Class {
	#name : #FamixTWithMethodsWithAccessesGlueTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithMethodsWithAccessesGlueTest',
	#classTraits : 'TFamixTWithMethodsWithAccessesGlueTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithMethodsWithAccessesGlueTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithMethodsWithAccessesGlue).
self entity class initializeSlots: self entity.
model add: entity. 
]
