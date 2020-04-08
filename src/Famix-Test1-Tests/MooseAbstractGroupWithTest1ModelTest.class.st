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
		'a1',
		'a2'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
MooseAbstractGroupWithTest1ModelTest >> setUp [
	super setUp.

	model := FamixTest1Model new.
	c1 := FamixTest1Class named: 'Class1' model: model.
	c2 := FamixTest1Class named: 'Class2' model: model.
	m1 := FamixTest1Method named: 'method1' model: model.
	m2 := FamixTest1Method named: 'method2' model: model.
	m3 := FamixTest1Method named: 'method3' model: model.
	a1 := FamixTest1Attribute named: 'attribute1' model: model.
	a2 := FamixTest1Attribute named: 'attribute2' model: model.
	anchor1 := FamixTest1SourceTextAnchor new
		source: 'method1\source1' withCRs;
		mooseModel: model;
		yourself.
	anchor2 := FamixTest1SourceTextAnchor new
		source: 'method2\source2a\source2b' withCRs;
		mooseModel: model;
		yourself.
	anchor3 := FamixTest1SourceTextAnchor new
		source: 'method3\source3a\source3b\source3c' withCRs;
		mooseModel: model;
		yourself.
	anchorC1 := FamixTest1SourceTextAnchor new
		source: 'Class1 definition' withCRs;
		mooseModel: model;
		yourself.

	c2 isStub: true.
	m3 isStub: true.
	a2 isStub: true.
	
	c1 addMethod: m1.
	m2 parentType: c2.	"opposite way"
	c2 addMethod: m3.
	c1 addAttribute: a1.
	c2 addAttribute: a2.
	c1 sourceAnchor: anchorC1.
	m1 sourceAnchor: anchor1.
	m2 sourceAnchor: anchor2.
	m3 sourceAnchor: anchor3
]

{ #category : #tests }
MooseAbstractGroupWithTest1ModelTest >> testAllBehaviourals [
	self assertCollection: model allBehaviourals hasSameElements: {m1 . m2 . m3}
]

{ #category : #tests }
MooseAbstractGroupWithTest1ModelTest >> testAllContainers [
	self assertCollection: model allContainers hasSameElements: { c1. c2. m1. m2. m3 }
]

{ #category : #tests }
MooseAbstractGroupWithTest1ModelTest >> testAllModelBehaviourals [
	self assertCollection: model allModelBehaviourals hasSameElements: {m1 . m2}
]

{ #category : #tests }
MooseAbstractGroupWithTest1ModelTest >> testAllModelContainers [
	self assertCollection: model allModelContainers hasSameElements: {c1 . m1 . m2}
]

{ #category : #tests }
MooseAbstractGroupWithTest1ModelTest >> testAllModelStructuralEntities [
	self assertCollection: model allModelStructuralEntities hasSameElements: { a1 }
]

{ #category : #tests }
MooseAbstractGroupWithTest1ModelTest >> testAllStructuralEntities [
	self assertCollection: model allStructuralEntities hasSameElements: {a1 . a2}
]
