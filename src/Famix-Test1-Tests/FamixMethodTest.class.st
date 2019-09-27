Class {
	#name : #FamixMethodTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'c1',
		'c2',
		'm1',
		'm2',
		'm3',
		'anchor1',
		'anchor2'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixMethodTest >> setUp [

	super setUp.

	model := FamixTest1Model new.
	model metamodel: FamixTest1Class metamodel.
	c1 := FamixTest1Class named: 'Class1'.
	c2 := FamixTest1Class named: 'Class2'.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	m3 := FamixTest1Method named: 'method3'.
	anchor1 := FamixTest1SourceTextAnchor new source: 'method1\source1' withCRs .
	anchor2 := FamixTest1SourceTextAnchor new source: 'method2\source2a\source2b' withCRs.
	model addAll: { c1. c2. m1. m2. m3. anchor1. anchor2 }.
	
	c1 addMethod: m1.
	m2 parentType: c2. "opposite way"
	c2 addMethod: m3.
	m1 sourceAnchor: anchor1.
	m2 sourceAnchor: anchor2.

]

{ #category : #tests }
FamixMethodTest >> testBelongsTo [
	self assert: m1 belongsTo equals: c1
]

{ #category : #tests }
FamixMethodTest >> testComputeNumberOfLinesOfCode [

	| withoutSource |
	
	self assert: m1 computeNumberOfLinesOfCode equals: 2.
	self assert: m2 computeNumberOfLinesOfCode equals: 3.

	withoutSource := FamixTest1Method named: #withoutSource.
	self assert: withoutSource computeNumberOfLinesOfCode equals: model notExistentMetricValue
]

{ #category : #tests }
FamixMethodTest >> testCyclomaticComplexity [

	self assert: m1 cyclomaticComplexity equals: model notExistentMetricValue.
	m1 cyclomaticComplexity: 100.
	self assert: m1 cyclomaticComplexity equals: 100.

]

{ #category : #tests }
FamixMethodTest >> testIsClass [

	self assert: c1 isClass. 	
	self assert: c2 isClass. 
	self deny: m1 isClass.
	self deny: m2 isClass.
	self deny: anchor1 isClass.
	self deny: anchor2 isClass.
]

{ #category : #tests }
FamixMethodTest >> testIsClassSide [

	m1 isClassSide: true.
	self assert: m1 isClassSide .

]

{ #category : #tests }
FamixMethodTest >> testIsConstant [

	self deny: m1 isConstant.
	m1 kind: #constant.
	self assert: m1 isConstant.

]

{ #category : #tests }
FamixMethodTest >> testIsConstructor [

	self deny: m1 isConstructor.
	m1 isConstructor: true.
	self assert: m1 isConstructor.

]

{ #category : #tests }
FamixMethodTest >> testIsGetter [

	self deny: m1 isGetter.
	m1 kind: #getter.
	self assert: m1 isGetter.

]

{ #category : #tests }
FamixMethodTest >> testIsMethod [

	self assert: m1 isMethod.
	self deny: c1 isMethod.
]

{ #category : #tests }
FamixMethodTest >> testIsPureAccessor [

	self deny: m1 isPureAccessor.
	m1 kind: #getter.
	self assert: m1 isPureAccessor.
	m1 kind: #setter.
	self assert: m1 isPureAccessor.

]

{ #category : #tests }
FamixMethodTest >> testIsSetter [

	self deny: m1 isSetter.
	m1 kind: #setter.
	self assert: m1 isSetter.

]

{ #category : #tests }
FamixMethodTest >> testKind [

	m1 kind: #constant.
	self assert: m1 kind equals: #constant.

]

{ #category : #tests }
FamixMethodTest >> testNumberOfLinesOfCode [

	self assert: m1 numberOfLinesOfCode equals: 2.
	self assert: m2 numberOfLinesOfCode equals: 3.
	m1 numberOfLinesOfCode: 100.
	self assert: m1 numberOfLinesOfCode equals: 100.
	


]

{ #category : #tests }
FamixMethodTest >> testNumberOfMessageSends [

	self assert: m1 numberOfMessageSends equals: model notExistentMetricValue.
	m1 numberOfMessageSends: 100.
	self assert: m1 numberOfMessageSends equals: 100.

]

{ #category : #tests }
FamixMethodTest >> testParentType [

	self assertCollection: m1 parentType equals: c1.
	self assertCollection: m2 parentType equals: c2.
]

{ #category : #tests }
FamixMethodTest >> testParentTypeIsStub [

	self deny: m1 parentTypeIsStub.
	c1 stub: true.
	self assert: m1 parentTypeIsStub.

]

{ #category : #tests }
FamixMethodTest >> testRelations [

	self assertCollection: c1 methods hasSameElements:  { m1 }.	
	self assertCollection: c2 methods hasSameElements:  { m2. m3 }.
	self assertCollection: m1 parentType equals: c1.
	self assertCollection: m2 parentType equals: c2.
]
