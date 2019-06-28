Class {
	#name : #FamixTReferenceTest,
	#superclass : #TestCase,
	#traits : 'TFamixTReferenceTest',
	#classTraits : 'TFamixTReferenceTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTReferenceTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTReference).
self entity class initializeSlots: self entity.
]
