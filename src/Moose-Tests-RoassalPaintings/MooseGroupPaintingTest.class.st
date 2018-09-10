Class {
	#name : #MooseGroupPaintingTest,
	#superclass : #TestCase,
	#instVars : [
		'window'
	],
	#category : #'Moose-Tests-RoassalPaintings'
}

{ #category : #running }
MooseGroupPaintingTest >> tearDown [
	window ifNotNil: [ window delete ].
	super tearDown
]

{ #category : #tests }
MooseGroupPaintingTest >> testBasic [

	| m |
	m := MooseGroup new.
	self assert: m symbolsUsedInName isEmpty.
	window := m viewNameCloud.
	self assert: window notNil.
	
]

{ #category : #tests }
MooseGroupPaintingTest >> testBasic02 [

	| m |
	m := MooseGroup new.
	m add: (FAMIXClass new name: 'Hello').
	m add: (FAMIXClass new name: 'World').
	
	self assert: m symbolsUsedInName size equals: 1.
	
	window := m viewNameCloud.
	self assert: window notNil.
	
]
