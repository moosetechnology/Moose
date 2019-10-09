Class {
	#name : #FamixTSourceAnchorTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSourceAnchorTest',
	#classTraits : 'TFamixTSourceAnchorTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTSourceAnchorTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTSourceAnchor).
self entity class initializeSlots: self entity.
model add: entity. 
]
