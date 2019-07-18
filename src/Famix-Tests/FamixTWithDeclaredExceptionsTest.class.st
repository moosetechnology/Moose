Class {
	#name : #FamixTWithDeclaredExceptionsTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithDeclaredExceptionsTest',
	#classTraits : 'TFamixTWithDeclaredExceptionsTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithDeclaredExceptionsTest >> setUp [
super setUp.
self entity: (MooseEntity new copyWithTalent:FamixTWithDeclaredExceptions).
self entity class initializeSlots: self entity.
]
