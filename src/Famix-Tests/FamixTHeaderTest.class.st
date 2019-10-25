Class {
	#name : #FamixTHeaderTest,
	#superclass : #TestCase,
	#traits : 'TFamixTHeaderTest',
	#classTraits : 'TFamixTHeaderTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTHeaderTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTHeader).
self entity class initializeSlots: self entity.
model add: entity. 
]
