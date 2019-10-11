Class {
	#name : #FamixTWithExceptionsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithExceptionsTest',
	#classTraits : 'TFamixTWithExceptionsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithExceptionsTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithExceptions).
self entity class initializeSlots: self entity.
model add: entity. 
]
