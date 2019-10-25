Class {
	#name : #FamixTWithTraitsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithTraitsTest',
	#classTraits : 'TFamixTWithTraitsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithTraitsTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithTraits).
self entity class initializeSlots: self entity.
model add: entity. 
]
