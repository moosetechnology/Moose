Class {
	#name : #FamixTSourceLanguageTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSourceLanguageTest',
	#classTraits : 'TFamixTSourceLanguageTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTSourceLanguageTest >> setUp [
super setUp.
	model := FamixModel new.
self entity: (MooseEntity new copyWithTalent:FamixTSourceLanguage).
self entity class initializeSlots: self entity.
model add: entity. 
]
