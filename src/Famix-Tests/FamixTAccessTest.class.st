Class {
	#name : #FamixTAccessTest,
	#superclass : #TestCase,
	#traits : 'TFamixTAccessTest',
	#classTraits : 'TFamixTAccessTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTAccessTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTAccess).
self entity class initializeSlots: self entity.
model add: entity. 
]
