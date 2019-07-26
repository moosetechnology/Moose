Class {
	#name : #FamixTPreprocessorDefineTest,
	#superclass : #TestCase,
	#traits : 'TFamixTPreprocessorDefineTest',
	#classTraits : 'TFamixTPreprocessorDefineTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTPreprocessorDefineTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTPreprocessorDefine).
self entity class initializeSlots: self entity.
model add: entity. 
]
