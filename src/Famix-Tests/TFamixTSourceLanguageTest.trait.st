Trait {
	#name : #TFamixTSourceLanguageTest,
	#instVars : [
		'withSourceLanguage1',
		'withSourceLanguage2'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTSourceLanguageTest >> testSourcedEntities [
withSourceLanguage1 := MooseEntity new copyWithTalent: FamixTWithSourceLanguage.
withSourceLanguage1 class initializeSlots: withSourceLanguage1.
model add: withSourceLanguage1.
withSourceLanguage2 := MooseEntity new copyWithTalent: FamixTWithSourceLanguage.
withSourceLanguage2 class initializeSlots: withSourceLanguage2.
model add: withSourceLanguage2.
self entity addSourcedEntity: withSourceLanguage1.
self entity addSourcedEntity: withSourceLanguage2.
self assert: (self entity sourcedEntities notEmpty).
self assertCollection: self entity sourcedEntities hasSameElements: {  withSourceLanguage1. withSourceLanguage2 }.
self assert: withSourceLanguage1 declaredSourceLanguage equals: self entity
]
