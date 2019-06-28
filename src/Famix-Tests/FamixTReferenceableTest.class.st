Class {
	#name : #FamixTReferenceableTest,
	#superclass : #TestCase,
	#traits : 'TFamixTReferenceableTest',
	#classTraits : 'TFamixTReferenceableTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTReferenceableTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTReferenceable).
self entity class initializeSlots: self entity.
]
