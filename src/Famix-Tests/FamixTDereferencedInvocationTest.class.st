Class {
	#name : #FamixTDereferencedInvocationTest,
	#superclass : #TestCase,
	#traits : 'TFamixTDereferencedInvocationTest',
	#classTraits : 'TFamixTDereferencedInvocationTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTDereferencedInvocationTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTDereferencedInvocation).
self entity class initializeSlots: self entity.
model add: entity. 
]
