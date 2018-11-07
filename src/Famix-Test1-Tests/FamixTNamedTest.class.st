Class {
	#name : #FamixTNamedTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'c1',
		'c2',
		'c3',
		'm1',
		'm2',
		'm3',
		'anchor1',
		'anchor2',
		'anchor3'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixTNamedTest >> setUp [

	super setUp.

	model := MooseModel new.
	model metamodel: FamixTest1Class metamodel.
	c1 := FamixTest1Class named: 'Class1'.
	c2 := FamixTest1Class named: 'Class2'.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	m3 := FamixTest1Method named: 'method3'.
	anchor1 := FamixTest1SourceTextAnchor new source: 'method1\source1' withCRs .
	anchor2 := FamixTest1SourceTextAnchor new source: 'method2\source2a\source2b' withCRs.
	anchor3 := FamixTest1SourceTextAnchor new source: 'method3\source3a\source3b\source3c' withCRs.
	
	model addAll: { c1. c2. m1. m2. m3. anchor1. anchor2 }.
	
	c1 addMethod: m1.
	m2 parentType: c2. "opposite way"
	c2 addMethod: m3.
	m1 sourceAnchor: anchor1.
	m2 sourceAnchor: anchor2.
	m3 sourceAnchor: anchor3.

]

{ #category : #tests }
FamixTNamedTest >> testHasUniqueMooseNameInModel [

	self assert: c1 hasUniqueMooseNameInModel.	
	self assert: c2 hasUniqueMooseNameInModel.
]

{ #category : #tests }
FamixTNamedTest >> testMooseNameOn [

	| newEntity |
	
	newEntity := FamixTest1Class new.

	self assert: (String streamContents: [ :s | newEntity mooseNameOn: s ]) equals: ''.
	
	newEntity name: 'NewEntity'.
	self assert: (String streamContents: [ :s | newEntity mooseNameOn: s ]) equals: 'NewEntity'.
]

{ #category : #tests }
FamixTNamedTest >> testName [

	self assert: c1 name equals: 'Class1'.
	c1 name: 'NewName'.
	self assert: c1 name equals: 'NewName'.

]

{ #category : #tests }
FamixTNamedTest >> testNameLength [

	self assert: m1 nameLength equals: 7.	
	self assert: c1 nameLength equals: 6.
]

{ #category : #tests }
FamixTNamedTest >> testNameResetsNameOfChildren [

	self assert: m1 mooseName equals: 'Class1.method1'.
	c1 name: 'NewName'.
	self assert: m1 mooseName equals: 'NewName.method1'.


]

{ #category : #tests }
FamixTNamedTest >> testResetMooseName [

	"more or less a smoke test"
	self assert: c1 name equals: 'Class1'.
	c1 resetMooseName.
	self assert: c1 name equals: 'Class1'.

]
