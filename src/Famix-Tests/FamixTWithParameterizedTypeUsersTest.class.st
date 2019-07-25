Class {
	#name : #FamixTWithParameterizedTypeUsersTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithParameterizedTypeUsersTest',
	#classTraits : 'TFamixTWithParameterizedTypeUsersTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithParameterizedTypeUsersTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithParameterizedTypeUsers).
self entity class initializeSlots: self entity.
model add: entity. 
]
