Class {
	#name : #FamixTDefinedInModuleTest,
	#superclass : #TestCase,
	#traits : 'TFamixTDefinedInModuleTest',
	#classTraits : 'TFamixTDefinedInModuleTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTDefinedInModuleTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTDefinedInModule).
self entity class initializeSlots: self entity.
model add: entity. 
]
