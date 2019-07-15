Class {
	#name : #FamixTWithImmediateSourceTest,
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
FamixTWithImmediateSourceTest >> setUp [

	super setUp.

	model := MooseModel new.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	anchor := FamixTest1SourceTextAnchor new.
	
	model addAll: { m1. m2. anchor }.

	

]

{ #category : #tests }
FamixTWithImmediateSourceTest >> testIsFile [

	self deny: anchor isFile
]

{ #category : #tests }
FamixTWithImmediateSourceTest >> testSource [

	anchor source: 'a code'.
	self assert: anchor source equals: 'a code'.	
]

{ #category : #tests }
FamixTWithImmediateSourceTest >> testSourceText [

	self assert: anchor sourceText isNil.
	
	anchor source: 'a code'.
	self assert: anchor sourceText equals: 'a code'
]
