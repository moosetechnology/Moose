Class {
	#name : #FamixTDeclaredExceptionTest,
	#superclass : #TestCase,
	#traits : 'TFamixTDeclaredExceptionTest',
	#classTraits : 'TFamixTDeclaredExceptionTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTDeclaredExceptionTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTDeclaredException).
self entity class initializeSlots: self entity.
model add: entity. 
]
