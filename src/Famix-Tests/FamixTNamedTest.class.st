Class {
	#name : #FamixTNamedTest,
	#superclass : #TestCase,
	#traits : 'TFamixTNamedTest',
	#classTraits : 'TFamixTNamedTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTNamedTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTNamed).
self entity class initializeSlots: self entity.
model add: entity. 
]
