Class {
	#name : #FamixSourceLanguageTest,
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
FamixSourceLanguageTest >> setUp [

	super setUp.

	model := FamixTest1Model new.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	lang := FamixTest1SourceLanguage new.
	
	anchor := FamixTest1SourceTextAnchor new.
	

]

{ #category : #tests }
FamixSourceLanguageTest >> testAddSourcedEntity [

	lang addSourcedEntity: m1.
	self assertCollection: lang sourcedEntities hasSameElements: { m1 }.
	lang addSourcedEntity: m2.
	self assertCollection: lang sourcedEntities hasSameElements: { m1. m2 }.


]

{ #category : #tests }
FamixSourceLanguageTest >> testIsAttached [

	self deny: lang isAttached.
	lang addSourcedEntity: m1.
	self assert: lang isAttached.
]

{ #category : #tests }
FamixSourceLanguageTest >> testIsFile [

	self deny: lang isAttached.
]

{ #category : #tests }
FamixSourceLanguageTest >> testSourcedEntities [

	self assert: lang sourcedEntities isEmpty.
	lang addSourcedEntity: m1.
	lang addSourcedEntity: m2.
	self assertCollection: lang sourcedEntities hasSameElements: { m1. m2 }.


]
