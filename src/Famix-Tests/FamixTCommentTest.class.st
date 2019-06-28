Class {
	#name : #FamixTCommentTest,
	#superclass : #TestCase,
	#traits : 'TFamixTCommentTest',
	#classTraits : 'TFamixTCommentTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTCommentTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTComment).
self entity class initializeSlots: self entity.
]
