Class {
	#name : #FamixTWithInvocationsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithInvocationsTest',
	#classTraits : 'TFamixTWithInvocationsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithInvocationsTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithInvocations).
self entity class initializeSlots: self entity.
]
