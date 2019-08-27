Class {
	#name : #OldFamixTWithImmediateSourceTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'm1',
		'm2',
		'anchor'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
OldFamixTWithImmediateSourceTest >> setUp [

	super setUp.

	model := FamixTest1MooseModel new.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	anchor := FamixTest1SourceTextAnchor new.
	
	model addAll: { m1. m2. anchor }.

	

]

{ #category : #tests }
OldFamixTWithImmediateSourceTest >> testIsFile [

	self deny: anchor isFile
]

{ #category : #tests }
OldFamixTWithImmediateSourceTest >> testSource [

	anchor source: 'a code'.
	self assert: anchor source equals: 'a code'.	
]

{ #category : #tests }
OldFamixTWithImmediateSourceTest >> testSourceText [

	self assert: anchor sourceText isNil.
	
	anchor source: 'a code'.
	self assert: anchor sourceText equals: 'a code'
]
