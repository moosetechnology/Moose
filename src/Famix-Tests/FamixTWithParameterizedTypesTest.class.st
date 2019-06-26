Class {
	#name : #FamixTWithParameterizedTypesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithParameterizedTypesTest',
	#classTraits : 'TFamixTWithParameterizedTypesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithParameterizedTypesTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithParameterizedTypes).
self entity class initializeSlots: self entity.
]
