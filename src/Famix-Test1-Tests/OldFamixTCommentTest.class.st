Class {
	#name : #OldFamixTCommentTest,
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
OldFamixTCommentTest >> setUp [

	super setUp.

	model := FamixTest1MooseModel new.
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
OldFamixTCommentTest >> testContainer [

	| comment |
	
	comment := FamixTest1Comment new.
	
	comment container: c1.
	self assert: comment container equals: c1.
	self assertCollection: c1 comments hasSameElements: { comment }
	
	
]

{ #category : #tests }
OldFamixTCommentTest >> testContent [

	| comment |
	
	comment := FamixTest1Comment new.
	
	self assert: comment content isNil.
	comment content: 'a comment'.
	self assert: comment content equals: 'a comment'.
]
