Class {
	#name : #FamixTCaughtExceptionTest,
	#superclass : #TestCase,
	#traits : 'TFamixTCaughtExceptionTest',
	#classTraits : 'TFamixTCaughtExceptionTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTCaughtExceptionTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTCaughtException).
self entity class initializeSlots: self entity.
model add: entity. 
]
