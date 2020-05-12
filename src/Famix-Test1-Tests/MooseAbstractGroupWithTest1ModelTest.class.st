Class {
	#name : #MooseAbstractGroupWithTest1ModelTest,
	#superclass : #FamixTest1SimpleModelTest,
	#instVars : [
		'a2'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
MooseAbstractGroupWithTest1ModelTest >> setUp [
	super setUp.
	a2 := FamixTest1Attribute named: 'attribute2' model: model.

	c2 isStub: true.
	m3 isStub: true.
	a2 isStub: true.

	c2 addAttribute: a2
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
