Class {
	#name : #FamixTThrownExceptionTest,
	#superclass : #TestCase,
	#traits : 'TFamixTThrownExceptionTest',
	#classTraits : 'TFamixTThrownExceptionTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTThrownExceptionTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTThrownException).
self entity class initializeSlots: self entity.
model add: entity. 
]
