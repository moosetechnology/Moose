Class {
	#name : #FamixTGlobalVariableTest,
	#superclass : #TestCase,
	#traits : 'TFamixTGlobalVariableTest',
	#classTraits : 'TFamixTGlobalVariableTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTGlobalVariableTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTGlobalVariable).
self entity class initializeSlots: self entity.
model add: entity. 
]
