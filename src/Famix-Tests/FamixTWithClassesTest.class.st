Class {
	#name : #FamixTWithClassesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithClassesTest',
	#classTraits : 'TFamixTWithClassesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithClassesTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithClasses).
self entity class initializeSlots: self entity.
]
