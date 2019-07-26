Class {
	#name : #FamixTPreprocessorIfdefTest,
	#superclass : #TestCase,
	#traits : 'TFamixTPreprocessorIfdefTest',
	#classTraits : 'TFamixTPreprocessorIfdefTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTPreprocessorIfdefTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTPreprocessorIfdef).
self entity class initializeSlots: self entity.
model add: entity. 
]
