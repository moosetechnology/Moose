Class {
	#name : #FamixTWithTypesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithTypesTest',
	#classTraits : 'TFamixTWithTypesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithTypesTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTWithTypes).
self entity class initializeSlots: self entity.
]
