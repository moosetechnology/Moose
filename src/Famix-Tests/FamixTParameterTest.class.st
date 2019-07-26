Class {
	#name : #FamixTParameterTest,
	#superclass : #TestCase,
	#traits : 'TFamixTParameterTest',
	#classTraits : 'TFamixTParameterTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTParameterTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTParameter).
self entity class initializeSlots: self entity.
model add: entity. 
]
