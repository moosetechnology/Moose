Trait {
	#name : #TFamixTWithSourceLanguageTest,
	#instVars : [
		'declaredSourceLanguage'
	],
	#traits : 'TFamixTest',
	#classTraits : 'TFamixTest classTrait',
	#category : #'Famix-Tests-Traits'
}

{ #category : #tests }
TFamixTWithSourceLanguageTest >> testDeclaredSourceLanguage [
declaredSourceLanguage := MooseEntity new copyWithTalent: FamixTSourceLanguage. 
declaredSourceLanguage class initializeSlots: declaredSourceLanguage.
model add: declaredSourceLanguage.
self entity declaredSourceLanguage: declaredSourceLanguage. 
self assert: (self entity declaredSourceLanguage notNil).
self assert: self entity declaredSourceLanguage equals: declaredSourceLanguage.
self assertCollection: declaredSourceLanguage sourcedEntities hasSameElements: {self entity}
]
