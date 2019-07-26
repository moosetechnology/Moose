Class {
	#name : #FamixTEnumValueTest,
	#superclass : #TestCase,
	#traits : 'TFamixTEnumValueTest',
	#classTraits : 'TFamixTEnumValueTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTEnumValueTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTEnumValue).
self entity class initializeSlots: self entity.
model add: entity. 
]
