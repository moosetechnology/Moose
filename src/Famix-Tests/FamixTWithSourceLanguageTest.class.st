Class {
	#name : #FamixTWithSourceLanguageTest,
	#superclass : #TestCase,
	#traits : 'TFamixTWithSourceLanguageTest',
	#classTraits : 'TFamixTWithSourceLanguageTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #overrides }
FamixTWithSourceLanguageTest >> setUp [
self entity: (MooseEntity new copyWithTalent:FamixTWithSourceLanguage).
self entity class initializeSlots: self entity.
]
