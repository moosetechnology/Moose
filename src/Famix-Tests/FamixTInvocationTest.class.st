Class {
	#name : #FamixTInvocationTest,
	#superclass : #TestCase,
	#traits : 'TFamixTInvocationTest',
	#classTraits : 'TFamixTInvocationTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTInvocationTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTInvocation).
self entity class initializeSlots: self entity.
]
