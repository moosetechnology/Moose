Class {
	#name : #FamixTParameterizedTypeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTParameterizedTypeTest',
	#classTraits : 'TFamixTParameterizedTypeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTParameterizedTypeTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTParameterizedType).
self entity class initializeSlots: self entity.
model add: entity. 
]
