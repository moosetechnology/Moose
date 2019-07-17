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
self entity: (MooseEntity new copyWithTalent:FamixTDirectFileAnchor).
self entity class initializeSlots: self entity.
]
