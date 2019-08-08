Class {
	#name : #MooseAbstractGroupWithTest1ModelTest,
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
		'anchor3',
		'anchorC1',
		'a1'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
MooseAbstractGroupWithTest1ModelTest >> setUp [
	super setUp.

	model := FamixTest1MooseModel new.
	c1 := FamixTest1Class named: 'Class1'.
	c2 := FamixTest1Class named: 'Class2'.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	m3 := FamixTest1Method named: 'method3'.
	a1 := FamixTest1Attribute named: 'attribute1'.
	anchor1 := FamixTest1SourceTextAnchor new source: 'method1\source1' withCRs.
	anchor2 := FamixTest1SourceTextAnchor new source: 'method2\source2a\source2b' withCRs.
	anchor3 := FamixTest1SourceTextAnchor new source: 'method3\source3a\source3b\source3c' withCRs.
	anchorC1 := FamixTest1SourceTextAnchor new source: 'Class1 definition' withCRs.

	model addAll: {c1 . c2 . m1 . m2 . m3 . a1. anchor1 . anchor2}.

	c1 addMethod: m1.
	m2 parentType: c2.	"opposite way"
	c2 addMethod: m3.
	c1 addAttribute: a1.
	c1 sourceAnchor: anchorC1.
	m1 sourceAnchor: anchor1.
	m2 sourceAnchor: anchor2.
	m3 sourceAnchor: anchor3
]

{ #category : #tests }
MooseAbstractGroupWithTest1ModelTest >> testAllContainers [
	self assertCollection: model allContainers hasSameElements: { c1. c2. m1. m2. m3 }
]

{ #category : #tests }
MooseAbstractGroupWithTest1ModelTest >> testAllStructuralEntities [
	self assertCollection: model allStructuralEntities hasSameElements: { a1 }
]
