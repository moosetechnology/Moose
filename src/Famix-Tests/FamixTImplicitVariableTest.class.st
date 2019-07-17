Class {
	#name : #FamixTImplicitVariableTest,
	#superclass : #TestCase,
	#traits : 'TFamixTImplicitVariableTest',
	#classTraits : 'TFamixTImplicitVariableTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTImplicitVariableTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTImplicitVariable).
self entity class initializeSlots: self entity.
]
