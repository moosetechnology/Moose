Class {
	#name : #FamixTModuleTest,
	#superclass : #TestCase,
	#traits : 'TFamixTModuleTest',
	#classTraits : 'TFamixTModuleTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTModuleTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTModule).
self entity class initializeSlots: self entity.
model add: entity. 
]
