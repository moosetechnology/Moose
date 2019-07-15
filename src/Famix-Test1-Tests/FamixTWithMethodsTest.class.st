Class {
	#name : #FamixTWithMethodsTest,
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
FamixTWithMethodsTest >> setUp [

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
FamixTWithMethodsTest >> testAddMethod [
	
	| newMethod | 
	
	newMethod := FamixTest1Method named: #newMethod.
	self deny: (c1 methods includes: newMethod).
	c1 addMethod: newMethod.
	self assert: (c1 methods includes: newMethod).
]

{ #category : #tests }
FamixTWithMethodsTest >> testMethods [
	
	| newMethod1 newMethod2 | 
	
	newMethod1 := FamixTest1Method named: #newMethod1.
	newMethod2 := FamixTest1Method named: #newMethod2.

	c1 methods: { newMethod1. newMethod2 }.
	self assertCollection: c1 methods hasSameElements: { newMethod1. newMethod2 }.
	self assert: newMethod1 parentType equals: c1. 
	self assert: newMethod2 parentType equals: c1. 
	
	
]

{ #category : #tests }
FamixTWithMethodsTest >> testMethodsDo [
	
	| aCollection |
	aCollection := Set new.
	c2 methodsDo: [ :each | aCollection add: each ].
	self assertCollection: aCollection hasSameElements: { m2. m3 }
]

{ #category : #tests }
FamixTWithMethodsTest >> testMethodsGroup [
	
	| group | 
	
	group := c1 methodsGroup.
	self assertCollection: group entities hasSameElements: { m1 }.
]

{ #category : #tests }
FamixTWithMethodsTest >> testNumberOfAccessorMethods [

	m1 kind: #getter.
	self assert: c1 numberOfAccessorMethods equals: 1.
	c1 numberOfAccessorMethods: 100.
	self assert: c1 numberOfAccessorMethods equals: 100.

]

{ #category : #tests }
FamixTWithMethodsTest >> testNumberOfConstructorMethods [

	m1 isConstructor: true.
	self assert: c1 numberOfConstructorMethods equals: 1.
	c1 numberOfConstructorMethods: 100.
	self assert: c1 numberOfConstructorMethods equals: 100.

]

{ #category : #tests }
FamixTWithMethodsTest >> testNumberOfLinesOfCode [

	self assert: c1 numberOfLinesOfCode equals: 2.
	self assert: c2 numberOfLinesOfCode equals: 7.


]

{ #category : #tests }
FamixTWithMethodsTest >> testNumberOfMessageSends [

	self assert: c1 numberOfMessageSends equals: model notExistentMetricValue.
	c1 numberOfMessageSends: 100.
	self assert: c1 numberOfMessageSends equals: 100.

]

{ #category : #tests }
FamixTWithMethodsTest >> testNumberOfMethodProtocols [

	m1 category: #accessing.
	self assert: c1 numberOfMethodProtocols equals: 1.
	c1 numberOfMethodProtocols: 100.
	self assert: c1 numberOfMethodProtocols equals: 100.

]

{ #category : #tests }
FamixTWithMethodsTest >> testNumberOfMethods [

	self assert: c1 numberOfMethods equals: 1.
	self assert: c2 numberOfMethods equals: 2.

	"explicit count"
	c1 numberOfMethods: 100.
	self assert: c1 numberOfMethods equals: 100.

]

{ #category : #tests }
FamixTWithMethodsTest >> testRelations [

	self assertCollection: c1 methods hasSameElements:  { m1 }.	
	self assertCollection: c2 methods hasSameElements:  { m2. m3 }.
	self assertCollection: m1 parentType equals: c1.
	self assertCollection: m2 parentType equals: c2.
]

{ #category : #tests }
FamixTWithMethodsTest >> testWeightedMethodCount [

	self assert: c1 weightedMethodCount equals: model notExistentMetricValue
]
