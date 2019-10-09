Class {
	#name : #FamixTWithModifiersTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithModifiersTest',
	#classTraits : 'TFamixTWithModifiersTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithModifiersTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithModifiers).
self entity class initializeSlots: self entity.
model add: entity. 
]
