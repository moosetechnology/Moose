Class {
	#name : #FamixTWithReferencesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithReferencesTest',
	#classTraits : 'TFamixTWithReferencesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithReferencesTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithReferences).
self entity class initializeSlots: self entity.
model add: entity. 
]
