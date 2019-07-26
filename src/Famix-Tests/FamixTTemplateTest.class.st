Class {
	#name : #FamixTTemplateTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTemplateTest',
	#classTraits : 'TFamixTTemplateTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTemplateTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTTemplate).
self entity class initializeSlots: self entity.
model add: entity. 
]
