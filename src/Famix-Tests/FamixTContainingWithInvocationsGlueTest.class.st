Class {
	#name : #FamixTContainingWithInvocationsGlueTest,
	#superclass : #TestCase,
	#traits : 'TFamixTContainingWithInvocationsGlueTest',
	#classTraits : 'TFamixTContainingWithInvocationsGlueTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTContainingWithInvocationsGlueTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTContainingWithInvocationsGlue).
self entity class initializeSlots: self entity.
model add: entity. 
]
