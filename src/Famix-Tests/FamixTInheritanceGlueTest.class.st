Class {
	#name : #FamixTInheritanceGlueTest,
	#superclass : #TestCase,
	#traits : 'TFamixTInheritanceGlueTest',
	#classTraits : 'TFamixTInheritanceGlueTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTInheritanceGlueTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTInheritanceGlue).
self entity class initializeSlots: self entity.
model add: entity. 
]
