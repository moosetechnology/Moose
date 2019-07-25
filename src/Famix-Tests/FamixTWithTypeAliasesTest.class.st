Class {
	#name : #FamixTWithTypeAliasesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithTypeAliasesTest',
	#classTraits : 'TFamixTWithTypeAliasesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithTypeAliasesTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithTypeAliases).
self entity class initializeSlots: self entity.
model add: entity. 
]
