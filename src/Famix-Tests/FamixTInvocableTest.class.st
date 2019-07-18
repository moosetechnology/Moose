Class {
	#name : #FamixTInvocableTest,
	#superclass : #TestCase,
	#traits : 'TFamixTInvocableTest',
	#classTraits : 'TFamixTInvocableTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTInvocableTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTInvocable).
self entity class initializeSlots: self entity.
]
