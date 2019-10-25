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
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTCaughtException).
self entity class initializeSlots: self entity.
model add: entity. 
]
