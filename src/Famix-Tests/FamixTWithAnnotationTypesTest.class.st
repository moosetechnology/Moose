Class {
	#name : #FamixTWithAnnotationTypesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithAnnotationTypesTest',
	#classTraits : 'TFamixTWithAnnotationTypesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithAnnotationTypesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithAnnotationTypes).
self entity class initializeSlots: self entity.
model add: entity. 
]
