Class {
	#name : #FamixTTypedAnnotationInstanceTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTypedAnnotationInstanceTest',
	#classTraits : 'TFamixTTypedAnnotationInstanceTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTypedAnnotationInstanceTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTTypedAnnotationInstance).
self entity class initializeSlots: self entity.
model add: entity. 
]
