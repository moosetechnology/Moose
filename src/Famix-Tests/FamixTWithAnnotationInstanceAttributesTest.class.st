Class {
	#name : #FamixTWithAnnotationInstanceAttributesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithAnnotationInstanceAttributesTest',
	#classTraits : 'TFamixTWithAnnotationInstanceAttributesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithAnnotationInstanceAttributesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithAnnotationInstanceAttributes).
self entity class initializeSlots: self entity.
model add: entity. 
]
