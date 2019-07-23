Class {
	#name : #FamixTAnnotationTypeAttributeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTAnnotationTypeAttributeTest',
	#classTraits : 'TFamixTAnnotationTypeAttributeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTAnnotationTypeAttributeTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTAnnotationTypeAttribute).
self entity class initializeSlots: self entity.
model add: entity. 
]
