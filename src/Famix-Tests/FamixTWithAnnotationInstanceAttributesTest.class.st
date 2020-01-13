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
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithAnnotationInstanceAttributes).
self entity class initializeSlots: self entity.
model add: entity. 
]
