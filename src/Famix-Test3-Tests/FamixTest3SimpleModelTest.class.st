Class {
	#name : #FamixTest3SimpleModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Test3-Tests'
}

{ #category : #testing }
FamixTest3SimpleModelTest class >> isAbstract [
	^ self = FamixTest3SimpleModelTest
]

{ #category : #accessing }
FamixTest3SimpleModelTest >> c1 [
	^ model entityNamed: #Class1
]

{ #category : #accessing }
FamixTest3SimpleModelTest >> c2 [
	^ model entityNamed: #Class2
]

{ #category : #tests }
FamixTest3SimpleModelTest >> classGroup [
	^ self class environment at: #FamixTest3ClassGroup
]

{ #category : #accessing }
FamixTest3SimpleModelTest >> inv1 [
	^ (model allUsing: FamixTInvocation) anyOne
]

{ #category : #accessing }
FamixTest3SimpleModelTest >> m1 [
	^ model entityNamed: 'Class1.m1'
]

{ #category : #accessing }
FamixTest3SimpleModelTest >> m2 [
	^ model entityNamed: 'Class2.m2'
]

{ #category : #accessing }
FamixTest3SimpleModelTest >> pt1 [
	^ model entityNamed: #int
]

{ #category : #accessing }
FamixTest3SimpleModelTest >> pt2 [
	^ model entityNamed: #float
]

{ #category : #accessing }
FamixTest3SimpleModelTest >> ref1 [
	^ (model allUsing: FamixTReference) detect: [ :ref | ref source = self m1 and: [ ref target = self pt1 ] ]
]

{ #category : #running }
FamixTest3SimpleModelTest >> setUp [
	| c1 c2 m1 m2 pt1 |
	super setUp.

	model := FamixTest3Model new.

	c1 := FamixTest3Class named: 'Class1' model: model.
	c2 := FamixTest3Class named: 'Class2' model: model.

	m1 := FamixTest3Method named: 'm1' model: model.
	m2 := FamixTest3Method named: 'm2' model: model.

	pt1 := FamixTest3PrimitiveType named: 'int' model: model.
	FamixTest3PrimitiveType named: 'float' model: model.

	FamixTest3Reference source: m1 target: pt1 model: model.
	FamixTest3Reference source: m1 target: c1 model: model.
	FamixTest3Invocation source: m1 target: {m1} model: model.

	m1 parentType: c1.
	m2 parentType: c2
]

{ #category : #tests }
FamixTest3SimpleModelTest >> typeGroup [
	^ self class environment at: #FamixTest3TypeGroup
]
