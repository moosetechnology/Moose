Class {
	#name : #FamixTTypedAnnotationInstanceAttributeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTypedAnnotationInstanceAttributeTest',
	#classTraits : 'TFamixTTypedAnnotationInstanceAttributeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTypedAnnotationInstanceAttributeTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTTypedAnnotationInstanceAttribute).
self entity class initializeSlots: self entity.
]
