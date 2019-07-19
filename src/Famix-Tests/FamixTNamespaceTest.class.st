Class {
	#name : #FamixTNamespaceTest,
	#superclass : #TestCase,
	#traits : 'TFamixTNamespaceTest',
	#classTraits : 'TFamixTNamespaceTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTNamespaceTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTNamespace).
self entity class initializeSlots: self entity.
model add: entity. 
]
