Class {
	#name : #FamixTWithLocalVariablesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithLocalVariablesTest',
	#classTraits : 'TFamixTWithLocalVariablesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithLocalVariablesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithLocalVariables).
self entity class initializeSlots: self entity.
model add: entity. 
]
