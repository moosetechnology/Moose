Class {
	#name : #FamixTContainingWithInvocationsGlueTest,
	#superclass : #TestCase,
	#traits : 'TFamixTContainingWithInvocationsGlueTest',
	#classTraits : 'TFamixTContainingWithInvocationsGlueTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTContainingWithInvocationsGlueTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTContainingWithInvocationsGlue).
self entity class initializeSlots: self entity.
]
