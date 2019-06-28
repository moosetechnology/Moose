Class {
	#name : #FamixTWithImplicitVariablesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithImplicitVariablesTest',
	#classTraits : 'TFamixTWithImplicitVariablesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithImplicitVariablesTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithImplicitVariables).
self entity class initializeSlots: self entity.
]
