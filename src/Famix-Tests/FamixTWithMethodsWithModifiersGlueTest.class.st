Class {
	#name : #FamixTWithMethodsWithModifiersGlueTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithMethodsWithModifiersGlueTest',
	#classTraits : 'TFamixTWithMethodsWithModifiersGlueTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithMethodsWithModifiersGlueTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithMethodsWithModifiersGlue).
self entity class initializeSlots: self entity.
]
