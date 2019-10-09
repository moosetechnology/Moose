Class {
	#name : #FamixAssociationTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'c1',
		'm1',
		'anchor1',
		'association1'
	],
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixAssociationTest >> setUp [

	super setUp.

	model := FamixTest1Model new.
	model metamodel: FamixTest1Class metamodel.
	c1 := FamixTest1Class named: 'Class1'.
	m1 := FamixTest1Method named: 'method1'.
	anchor1 := FamixTest1SourceTextAnchor new source: 'method1\source1' withCRs .
	association1 := FamixTest1Association new.
	model addAll: { c1. m1. anchor1. association1 }.
	
	
]

{ #category : #tests }
FamixAssociationTest >> testIsAssociation [

	self assert: association1 isAssociation.
	self deny: c1 isAssociation. 	
	self deny: m1 isAssociation.
	self deny: anchor1 isAssociation.

]
