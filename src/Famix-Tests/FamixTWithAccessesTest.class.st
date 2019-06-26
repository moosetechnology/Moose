Class {
	#name : #FamixTWithAccessesTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithAccessesTest',
	#classTraits : 'TFamixTWithAccessesTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithAccessesTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithAccesses).
self entity class initializeSlots: self entity.
]
