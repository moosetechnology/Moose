Class {
	#name : #FamixTLocalVariableTest,
	#superclass : #TestCase,
	#traits : 'TFamixTLocalVariableTest',
	#classTraits : 'TFamixTLocalVariableTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTLocalVariableTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTLocalVariable).
self entity class initializeSlots: self entity.
model add: entity. 
]
