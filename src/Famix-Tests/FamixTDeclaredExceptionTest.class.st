Class {
	#name : #FamixTDeclaredExceptionTest,
	#superclass : #TestCase,
	#traits : 'TFamixTDeclaredExceptionTest',
	#classTraits : 'TFamixTDeclaredExceptionTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTDeclaredExceptionTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTDeclaredException).
self entity class initializeSlots: self entity.
]
