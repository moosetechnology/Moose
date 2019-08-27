Class {
	#name : #OldFamixTest1TestIssue22,
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
OldFamixTest1TestIssue22 >> setUp [

	super setUp.

	model := FamixTest1MooseModel new.
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
OldFamixTest1TestIssue22 >> testNumberOfComments [
	<expectedFailure>
	| comment |
	comment := FamixTest1Comment new.

	"https://github.com/pavel-krivanek/Moose/issues/22"
	"FamixTWithCommentsTest>>#testNumberOfComments"
	self assert: c1 numberOfComments equals: 0.
	c1 resetPrivateState.
	c1 addComment: comment.
	self assert: c1 numberOfComments equals: 2.
	c1 resetPrivateState.
	c1 addComment: comment.
	self assert: c1 numberOfComments equals: 3.
	c1 resetPrivateState.
	c1 numberOfComments: 100.
	self assert: c1 numberOfComments equals: 100
]
