Class {
	#name : #FamixTWithAnnotationInstancesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithAnnotationInstancesTest',
	#classTraits : 'TFamixTWithAnnotationInstancesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithAnnotationInstancesTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithAnnotationInstances).
self entity class initializeSlots: self entity.
model add: entity. 
]
