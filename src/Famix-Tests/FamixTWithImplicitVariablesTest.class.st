Class {
	#name : #FamixTWithImplicitVariablesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithImplicitVariablesTest',
	#classTraits : 'TFamixTWithImplicitVariablesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithImplicitVariablesTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithImplicitVariables).
self entity class initializeSlots: self entity.
model add: entity. 
]
