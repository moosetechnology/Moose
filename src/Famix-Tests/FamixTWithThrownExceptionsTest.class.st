Class {
	#name : #FamixTWithThrownExceptionsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithThrownExceptionsTest',
	#classTraits : 'TFamixTWithThrownExceptionsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithThrownExceptionsTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithThrownExceptions).
self entity class initializeSlots: self entity.
]
