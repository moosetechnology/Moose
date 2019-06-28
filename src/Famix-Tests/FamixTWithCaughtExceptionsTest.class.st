Class {
	#name : #FamixTWithCaughtExceptionsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithCaughtExceptionsTest',
	#classTraits : 'TFamixTWithCaughtExceptionsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithCaughtExceptionsTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithCaughtExceptions).
self entity class initializeSlots: self entity.
]
