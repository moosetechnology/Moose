Class {
	#name : #FamixTMultipleFileAnchorTest,
	#superclass : #TestCase,
	#traits : 'TFamixTMultipleFileAnchorTest',
	#classTraits : 'TFamixTMultipleFileAnchorTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTMultipleFileAnchorTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTMultipleFileAnchor).
self entity class initializeSlots: self entity.
]
