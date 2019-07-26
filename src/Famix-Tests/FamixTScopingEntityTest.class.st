Class {
	#name : #FamixTScopingEntityTest,
	#superclass : #TestCase,
	#traits : 'TFamixTScopingEntityTest',
	#classTraits : 'TFamixTScopingEntityTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTScopingEntityTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTScopingEntity).
self entity class initializeSlots: self entity.
model add: entity. 
]
