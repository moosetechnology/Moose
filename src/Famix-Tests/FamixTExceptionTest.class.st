Class {
	#name : #FamixTExceptionTest,
	#superclass : #TestCase,
	#traits : 'TFamixTExceptionTest',
	#classTraits : 'TFamixTExceptionTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTExceptionTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTException).
self entity class initializeSlots: self entity.
model add: entity. 
]
