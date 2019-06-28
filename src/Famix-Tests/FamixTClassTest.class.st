Class {
	#name : #FamixTClassTest,
	#superclass : #TestCase,
	#traits : 'TFamixTClassTest',
	#classTraits : 'TFamixTClassTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTClassTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTClass).
self entity class initializeSlots: self entity.
]
