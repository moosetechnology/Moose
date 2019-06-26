Class {
	#name : #FamixTWithLocalVariablesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithLocalVariablesTest',
	#classTraits : 'TFamixTWithLocalVariablesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithLocalVariablesTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithLocalVariables).
self entity class initializeSlots: self entity.
]
