Class {
	#name : #FamixTDirectFileAnchorTest,
	#superclass : #TestCase,
	#traits : 'TFamixTDirectFileAnchorTest',
	#classTraits : 'TFamixTDirectFileAnchorTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTDirectFileAnchorTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTDirectFileAnchor).
self entity class initializeSlots: self entity.
model add: entity. 
]
