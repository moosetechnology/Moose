Class {
	#name : #FamixTWithThrownExceptionsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithThrownExceptionsTest',
	#classTraits : 'TFamixTWithThrownExceptionsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithThrownExceptionsTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithThrownExceptions).
self entity class initializeSlots: self entity.
model add: entity. 
]
