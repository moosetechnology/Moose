Class {
	#name : #FamixTWithSourceAnchorTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithSourceAnchorTest',
	#classTraits : 'TFamixTWithSourceAnchorTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithSourceAnchorTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithSourceAnchor).
self entity class initializeSlots: self entity.
]
