Class {
	#name : #FamixTWithCommentsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithCommentsTest',
	#classTraits : 'TFamixTWithCommentsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithCommentsTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithComments).
self entity class initializeSlots: self entity.
]
