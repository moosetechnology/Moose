Class {
	#name : #FamixTest1SimpleModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'anchor1',
		'anchor2',
		'anchor3',
		'c1',
		'c2',
		'c3',
		'm1',
		'm2',
		'm3',
		'anchorC1',
		'a1'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #testing }
FamixTest1SimpleModelTest class >> isAbstract [
	^ self = FamixTest1SimpleModelTest
]

{ #category : #running }
FamixTest1SimpleModelTest >> setUp [
	super setUp.

	model := FamixTest1Model new.
	c1 := FamixTest1Class named: 'Class1'.
	c2 := FamixTest1Class named: 'Class2'.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	m3 := FamixTest1Method named: 'method3'.
	a1 := FamixTest1Attribute named: 'attribute1'.
	anchorC1 := FamixTest1SourceTextAnchor source: 'Class1 definition' withCRs.
	anchor1 := FamixTest1SourceTextAnchor source: 'method1\source1' withCRs.
	anchor2 := FamixTest1SourceTextAnchor source: 'method2\source2a\source2b' withCRs.
	anchor3 := FamixTest1SourceTextAnchor source: 'method3\source3a\source3b\source3c' withCRs.

	model addAll: {c1 . c2 . m1 . m2 . m3 . anchor1 . anchor2 . anchor3}.

	c1 addMethod: m1.
	m2 parentType: c2.	"opposite way"
	c2 addMethod: m3.
	c1 addAttribute: a1.
	c1 sourceAnchor: anchorC1.
	m1 sourceAnchor: anchor1.
	m2 sourceAnchor: anchor2.
	m3 sourceAnchor: anchor3
]
