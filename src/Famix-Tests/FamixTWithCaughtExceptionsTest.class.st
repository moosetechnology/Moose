Class {
	#name : #FamixTWithCaughtExceptionsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithCaughtExceptionsTest',
	#classTraits : 'TFamixTWithCaughtExceptionsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithCaughtExceptionsTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithCaughtExceptions).
self entity class initializeSlots: self entity.
model add: entity. 
]
