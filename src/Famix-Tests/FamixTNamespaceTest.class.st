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
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTNamespace).
self entity class initializeSlots: self entity.
model add: entity. 
]
