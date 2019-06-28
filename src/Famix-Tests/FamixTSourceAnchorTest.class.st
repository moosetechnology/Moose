Class {
	#name : #FamixTSourceAnchorTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSourceAnchorTest',
	#classTraits : 'TFamixTSourceAnchorTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTSourceAnchorTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTSourceAnchor).
self entity class initializeSlots: self entity.
]
