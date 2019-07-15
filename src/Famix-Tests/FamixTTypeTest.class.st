Class {
	#name : #FamixTTypeTest,
	#superclass : #TestCase,
	#traits : 'TFamixTTypeTest',
	#classTraits : 'TFamixTTypeTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTTypeTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTType).
self entity class initializeSlots: self entity.
]
