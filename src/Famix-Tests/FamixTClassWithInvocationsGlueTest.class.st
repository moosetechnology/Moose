Class {
	#name : #FamixTClassWithInvocationsGlueTest,
	#superclass : #TestCase,
	#traits : 'TFamixTClassWithInvocationsGlueTest',
	#classTraits : 'TFamixTClassWithInvocationsGlueTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTClassWithInvocationsGlueTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTClassWithInvocationsGlue).
self entity class initializeSlots: self entity.
model add: entity. 
]
