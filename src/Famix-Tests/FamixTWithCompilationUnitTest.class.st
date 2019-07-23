Class {
	#name : #FamixTWithCompilationUnitTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithCompilationUnitTest',
	#classTraits : 'TFamixTWithCompilationUnitTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithCompilationUnitTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithCompilationUnit).
self entity class initializeSlots: self entity.
model add: entity. 
]
