Class {
	#name : #FamixTMultipleFileAnchorTest,
	#superclass : #TestCase,
	#traits : 'TFamixTMultipleFileAnchorTest',
	#classTraits : 'TFamixTMultipleFileAnchorTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTMultipleFileAnchorTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTMultipleFileAnchor).
self entity class initializeSlots: self entity.
model add: entity. 
]
