Class {
	#name : #FamixTFileAnchorTest,
	#superclass : #TestCase,
	#traits : 'TFamixTFileAnchorTest',
	#classTraits : 'TFamixTFileAnchorTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTFileAnchorTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTFileAnchor).
self entity class initializeSlots: self entity.
model add: entity. 
]
