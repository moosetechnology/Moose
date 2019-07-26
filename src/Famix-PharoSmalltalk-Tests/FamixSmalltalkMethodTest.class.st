Class {
	#name : #FamixSmalltalkMethodTest,
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
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #running }
FamixSmalltalkMethodTest >> setUp [

	super setUp.

	model := FamixStMooseModel new.
	c1 := FamixStClass named: 'Class1'.
	c2 := FamixStClass named: 'Class2'.
	m1 := FamixStMethod named: 'method1'.
	m2 := FamixStMethod named: 'method2'.
	m3 := FamixStMethod named: 'method3'.
	anchor1 := FamixStSourceTextAnchor new source: 'method1\source1' withCRs .
	anchor2 := FamixStSourceTextAnchor new source: 'method2\source2a\source2b' withCRs.
	anchor3 := FamixStSourceTextAnchor new source: 'method3\source3a\source3b\source3c' withCRs.
	
	model addAll: { c1. c2. m1. m2. m3. anchor1. anchor2 }.
	
	c1 addMethod: m1.
	m2 parentType: c2. "opposite way"
	c2 addMethod: m3.
	m1 sourceAnchor: anchor1.
	m2 sourceAnchor: anchor2.
	m3 sourceAnchor: anchor3.

]

{ #category : #tests }
FamixSmalltalkMethodTest >> testNumberOfMethodProtocols [

	m1 protocol: #accessing.
	self assert: c1 numberOfMethodProtocols equals: 1.
	c1 numberOfMethodProtocols: 100.
	self assert: c1 numberOfMethodProtocols equals: 100.

]

{ #category : #tests }
FamixSmalltalkMethodTest >> testProtocol [

	self assert: m1 protocol isNil.
	m1 protocol: 'accessing'.
	self assert: m1 protocol equals: 'accessing'.

]
