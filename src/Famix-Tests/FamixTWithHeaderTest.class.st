Class {
	#name : #FamixTWithHeaderTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithHeaderTest',
	#classTraits : 'TFamixTWithHeaderTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithHeaderTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithHeader).
self entity class initializeSlots: self entity.
]
