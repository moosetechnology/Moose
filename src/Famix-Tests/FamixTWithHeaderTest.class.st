Class {
	#name : #FamixTWithHeaderTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithHeaderTest',
	#classTraits : 'TFamixTWithHeaderTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithHeaderTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTWithHeader).
self entity class initializeSlots: self entity.
model add: entity. 
]
