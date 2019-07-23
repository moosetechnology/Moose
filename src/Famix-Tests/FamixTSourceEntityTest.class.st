Class {
	#name : #FamixTSourceEntityTest,
	#superclass : #TestCase,
	#traits : 'TFamixTSourceEntityTest + TFamixTWithSourceLanguageTest + TFamixTest + TFamixTWithSourceAnchorTest',
	#classTraits : 'TFamixTSourceEntityTest classTrait + TFamixTWithSourceLanguageTest classTrait + TFamixTest classTrait + TFamixTWithSourceAnchorTest classTrait',
	#category : #'Famix-Tests-Tests'
}

{ #category : #'as yet unclassified' }
FamixTSourceEntityTest class >> removeUser: aClass [ 
	
]

{ #category : #overrides }
FamixTSourceEntityTest >> setUp [
super setUp.
	model := MooseModel new metamodel: FamixGenerator metamodel.
self entity: (MooseEntity new copyWithTalent:FamixTSourceEntity).
self entity class initializeSlots: self entity.
model add: entity. 
]
