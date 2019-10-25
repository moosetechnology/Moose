Class {
	#name : #FamixClassTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'c1',
		'c2',
		'm1',
		'm2',
		'anchor1',
		'anchor2'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixClassTest >> setUp [

	super setUp.

	model := FamixTest1Model new.
	model metamodel: FamixTest1Class metamodel.	
	c1 := FamixTest1Class named: 'Class1'.
	c2 := FamixTest1Class named: 'Class2'.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	anchor1 := FamixTest1SourceTextAnchor new source: 'method1\source1' withCRs .
	anchor2 := FamixTest1SourceTextAnchor new source: 'method2\source2a\source2b' withCRs.
	model addAll: { c1. c2. m1. m2. anchor1. anchor2 }.
	


]

{ #category : #tests }
FamixClassTest >> testComments [

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
FamixClassTest >> testHasComments [
	| comment |
	comment := FamixTest1Comment new.

	self deny: c1 hasComments.
	c1 addComment: comment.
	self assert: c1 hasComments
]

{ #category : #tests }
FamixClassTest >> testIsClass [

	self assert: c1 isClass. 	
	self assert: c2 isClass. 
	self deny: m1 isClass.
	self deny: m2 isClass.
	self deny: anchor1 isClass.
	self deny: anchor2 isClass.
]

{ #category : #tests }
FamixClassTest >> testIsTestCase [

	self deny: c1 isTestCase.
	c1 isTestCase: true.
	self assert: c1 isTestCase.
	

]

{ #category : #tests }
FamixClassTest >> testPrivateAddComment [
	| comment |
	comment := FamixTest1Comment new.
	self deny: c1 hasComments.
	c1 addComment: comment.
	self assertCollection: c1 comments hasSameElements: {comment}
]

{ #category : #tests }
FamixClassTest >> testRemoveComment [
	| comment |
	comment := FamixTest1Comment new.
	self deny: c1 hasComments.
	c1 addComment: comment.
	c1 removeComment: comment.
	self assert: c1 comments isEmpty
]

{ #category : #tests }
FamixClassTest >> testWeightOfAClass [

	self assert: c1 weightOfAClass equals: model notExistentMetricValue.
	c1 weightOfAClass: 100.
	self assert: c1 weightOfAClass equals: 100.
]
