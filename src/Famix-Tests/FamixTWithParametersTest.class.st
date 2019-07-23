Class {
	#name : #FamixTWithParametersTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithParametersTest',
	#classTraits : 'TFamixTWithParametersTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithParametersTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithParameters).
self entity class initializeSlots: self entity.
model add: entity. 
]
