Class {
	#name : #FamixTFileTest,
	#superclass : #TestCase,
	#traits : 'TFamixTFileTest',
	#classTraits : 'TFamixTFileTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTFileTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTFile).
self entity class initializeSlots: self entity.
model add: entity. 
]
