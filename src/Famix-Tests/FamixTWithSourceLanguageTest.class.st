Class {
	#name : #FamixTWithSourceLanguageTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithSourceLanguageTest',
	#classTraits : 'TFamixTWithSourceLanguageTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithSourceLanguageTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTWithSourceLanguage).
self entity class initializeSlots: self entity.
model add: entity. 
]
