Class {
	#name : #OldFamixTest1TestIssue28,
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
		'anchorC1'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
OldFamixTest1TestIssue28 >> setUp [

	super setUp.

	model := FamixTest1Model new.
	c1 := FamixTest1Class named: 'Class1'.
	c2 := FamixTest1Class named: 'Class2'.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.
	m3 := FamixTest1Method named: 'method3'.
	anchor1 := FamixTest1SourceTextAnchor new source: 'method1\source1' withCRs .
	anchor2 := FamixTest1SourceTextAnchor new source: 'method2\source2a\source2b' withCRs.
	anchor3 := FamixTest1SourceTextAnchor new source: 'method3\source3a\source3b\source3c' withCRs.
	anchorC1 := FamixTest1SourceTextAnchor new source: 'Class1 definition' withCRs.
	
	model addAll: { c1. c2. m1. m2. m3. anchor1. anchor2 }.
	
	c1 addMethod: m1.
	m2 parentType: c2. "opposite way"
	c2 addMethod: m3.
	c1 sourceAnchor: anchorC1.
	m1 sourceAnchor: anchor1.
	m2 sourceAnchor: anchor2.
	m3 sourceAnchor: anchor3.

]

{ #category : #tests }
OldFamixTest1TestIssue28 >> testAllWithScope [

	<expectedFailure>

	self assertCollection: (c1 allWithScope: FamixTClass) hasSameElements: { c1 }.
	self assertCollection: (c1 allWithScope: FamixTest1Class) hasSameElements: { c1 }.

	self assertCollection: (c1 allWithScope: FamixTMethod) hasSameElements: { m1 }.
	self assertCollection: (c1 allWithScope: FamixTest1Method) hasSameElements: { m1 }.

	self assertCollection: (c2 allWithScope: FamixTMethod) hasSameElements: { m2. m3 }.
	self assertCollection: (c2 allWithScope: FamixTest1Method) hasSameElements: { m2. m3 }.

	self assertCollection: (c1 allWithScope: FamixTSourceAnchor) hasSameElements: { }.
	self assertCollection: (c1 allWithScope: FamixTest1SourceTextAnchor) hasSameElements: { }.
	self assertCollection: (c2 allWithScope: FamixTSourceAnchor) hasSameElements: { }.
	self assertCollection: (c2 allWithScope: FamixTest1SourceTextAnchor) hasSameElements: { }.

	self assertCollection: (m1 allWithScope: FamixTClass) hasSameElements: { }.
	self assertCollection: (m1 allWithScope: FamixTest1Class) hasSameElements: { }.

]
