Class {
	#name : #FamixTWithParameterizedTypesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithParameterizedTypesTest',
	#classTraits : 'TFamixTWithParameterizedTypesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithParameterizedTypesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithParameterizedTypes).
self entity class initializeSlots: self entity.
model add: entity. 
]
