Class {
	#name : #FamixTExceptionTest,
	#superclass : #TestCase,
	#traits : 'TFamixTExceptionTest',
	#classTraits : 'TFamixTExceptionTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTExceptionTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTException).
self entity class initializeSlots: self entity.
]
