Class {
	#name : #FamixTWithFunctionsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithFunctionsTest',
	#classTraits : 'TFamixTWithFunctionsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithFunctionsTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithFunctions).
self entity class initializeSlots: self entity.
model add: entity. 
]
