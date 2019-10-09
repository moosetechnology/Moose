Class {
	#name : #FamixTWithNamespacesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithNamespacesTest',
	#classTraits : 'TFamixTWithNamespacesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithNamespacesTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithNamespaces).
self entity class initializeSlots: self entity.
model add: entity. 
]
