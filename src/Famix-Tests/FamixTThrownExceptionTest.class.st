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
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTThrownException).
self entity class initializeSlots: self entity.
model add: entity. 
]
