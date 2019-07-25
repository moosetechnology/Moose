Class {
	#name : #FamixTTypedAnnotationInstanceAttributeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTypedAnnotationInstanceAttributeTest',
	#classTraits : 'TFamixTTypedAnnotationInstanceAttributeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTypedAnnotationInstanceAttributeTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTTypedAnnotationInstanceAttribute).
self entity class initializeSlots: self entity.
model add: entity. 
]
