Class {
	#name : #FamixTReferenceableTest,
	#superclass : #TestCase,
	#traits : 'TFamixTReferenceableTest',
	#classTraits : 'TFamixTReferenceableTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTReferenceableTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTReferenceable).
self entity class initializeSlots: self entity.
model add: entity. 
]
