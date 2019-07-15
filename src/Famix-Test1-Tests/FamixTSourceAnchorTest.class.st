Class {
	#name : #FamixTSourceAnchorTest,
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
FamixTSourceAnchorTest >> setUp [

	super setUp.

	model := MooseModel new.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	anchor := FamixTest1SourceAnchor new.
	
	model addAll: { m1. m2. anchor }.
	
	

]

{ #category : #tests }
FamixTSourceAnchorTest >> testElement [

	anchor element: m1.
	self assert: anchor element equals: m1.
	self assert: m1 sourceAnchor equals: anchor.
	
	anchor element: m2.
	self assert: anchor element equals: m2.
	self assert: m2 sourceAnchor equals: anchor.
	
]

{ #category : #tests }
FamixTSourceAnchorTest >> testLineCount [

	self assert: anchor lineCount equals: model notExistentMetricValue.
	
]

{ #category : #tests }
FamixTSourceAnchorTest >> testSourceText [

	"source text is empty by default"
	self assert: anchor sourceText isNil
]
