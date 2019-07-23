Class {
	#name : #FamixTWithDereferencedInvocationsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithDereferencedInvocationsTest',
	#classTraits : 'TFamixTWithDereferencedInvocationsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithDereferencedInvocationsTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithDereferencedInvocations).
self entity class initializeSlots: self entity.
model add: entity. 
]
