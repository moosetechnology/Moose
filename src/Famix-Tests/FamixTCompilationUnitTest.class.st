Class {
	#name : #FamixTCompilationUnitTest,
	#superclass : #TestCase,
	#traits : 'TFamixTCompilationUnitTest',
	#classTraits : 'TFamixTCompilationUnitTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTCompilationUnitTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTCompilationUnit).
self entity class initializeSlots: self entity.
model add: entity. 
]
