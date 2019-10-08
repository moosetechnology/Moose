Class {
	#name : #FamixWithSourceLanguageTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'm1',
		'm2',
		'anchor',
		'lang'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixWithSourceLanguageTest >> setUp [

	super setUp.

	model := FamixTest1Model new.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	lang := FamixTest1SourceLanguage new.
	
	anchor := FamixTest1SourceTextAnchor new.
	

]

{ #category : #tests }
FamixWithSourceLanguageTest >> testAddSourcedEntity [

	lang addSourcedEntity: m1.
	self assertCollection: lang sourcedEntities hasSameElements: { m1 }.
	lang addSourcedEntity: m2.
	self assertCollection: lang sourcedEntities hasSameElements: { m1. m2 }.


]

{ #category : #tests }
FamixWithSourceLanguageTest >> testDeclaredSourceLanguage [

	self assert: m1 declaredSourceLanguage isNil.
	m1 declaredSourceLanguage: lang.
	self assert: m1 declaredSourceLanguage equals: lang.
]
