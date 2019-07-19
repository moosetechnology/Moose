Class {
	#name : #FamixTParameterizedTypeUserTest,
	#superclass : #TestCase,
	#traits : 'TFamixTParameterizedTypeUserTest',
	#classTraits : 'TFamixTParameterizedTypeUserTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTParameterizedTypeUserTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTParameterizedTypeUser).
self entity class initializeSlots: self entity.
model add: entity. 
]
