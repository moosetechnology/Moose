Class {
	#name : #FamixTWithCommentsTest,
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
FamixTWithCommentsTest >> setUp [

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
FamixTWithCommentsTest >> testComments [

	| comment comment2 |
	
	comment := FamixTest1Comment new.
	comment2 := FamixTest1Comment new.

	self assert: c1 comments isEmpty.
	
	self deny: comment container equals: c1.
	self deny: comment2 container equals: c1.
	c1 comments: { comment. comment2 }.
	self assert: comment container equals: c1.
	self assert: comment2 container equals: c1.

]

{ #category : #tests }
FamixTWithCommentsTest >> testHasComments [

	| comment comment2 |
	
	comment := FamixTest1Comment new.
	comment2 := FamixTest1Comment new.

	self deny: c1 hasComments.
	c1 privateAddComment: comment.
	self assert: c1 hasComments.

]

{ #category : #tests }
FamixTWithCommentsTest >> testPrivateAddComment [

	| comment |
	
	comment := FamixTest1Comment new.
	self deny: c1 hasComments.
	c1 privateAddComment: comment.
	self assertCollection: c1 comments hasSameElements: { comment }

]

{ #category : #tests }
FamixTWithCommentsTest >> testRemoveComment [

	| comment |
	
	comment := FamixTest1Comment new.
	self deny: c1 hasComments.
	c1 privateAddComment: comment.
	c1 removeComment: comment.
	self assert: c1 comments isEmpty.

]
