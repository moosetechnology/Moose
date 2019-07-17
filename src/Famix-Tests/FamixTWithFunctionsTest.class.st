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
self entity: (MooseEntity new copyWithTalent:FamixTWithFunctions).
self entity class initializeSlots: self entity.
]
