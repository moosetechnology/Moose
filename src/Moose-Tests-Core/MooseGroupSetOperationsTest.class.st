Class {
	#name : #MooseGroupSetOperationsTest,
	#superclass : #TestCase,
	#instVars : [
		'group1',
		'group2'
	],
	#category : #'Moose-Tests-Core'
}

{ #category : #running }
MooseGroupSetOperationsTest >> setUp [
	
	super setUp.
	group1 := MooseGroup withAll: #(1 2 3 4 5).
	group2 := MooseGroup withAll: #(4 5 6 7 8)
]

{ #category : #testing }
MooseGroupSetOperationsTest >> testDifference [
	| result |
	result := group1 difference: group2.
	self assert: result size equals: 3.
	self assert: (result includes: 1).
	self assert: (result includes: 2).
	self assert: (result includes: 3).
	result := group2 difference: group1.
	self assert: result size equals: 3.
	self assert: (result includes: 6).
	self assert: (result includes: 7).
	self assert: (result includes: 8)
]

{ #category : #testing }
MooseGroupSetOperationsTest >> testDifferenceAlias [
	| result |
	result := group1 \ group2.
	self assert: result size equals: 3.
	self assert: (result includes: 1).
	self assert: (result includes: 2).
	self assert: (result includes: 3).
	result := group2 \ group1.
	self assert: result size equals: 3.
	self assert: (result includes: 6).
	self assert: (result includes: 7).
	self assert: (result includes: 8)
]

{ #category : #testing }
MooseGroupSetOperationsTest >> testIntersect [
	| resultat |
	resultat := group1 intersection: group2.
	self assert: resultat size equals: 2.
	self assert: (resultat entities includes: 4).
	self assert: (resultat entities includes: 5)
]

{ #category : #testing }
MooseGroupSetOperationsTest >> testResultClass [
	
	| result |
	result := group1 difference: group2.
	self assert: (result isKindOf: MooseGroup)
]

{ #category : #testing }
MooseGroupSetOperationsTest >> testUnion [
	| result |
	result := group1 union: group2.
	self assert: result size equals: 8.
	self assert: (result includes: 1).
	self assert: (result includes: 2).
	self assert: (result includes: 3).
	self assert: (result includes: 4).
	self assert: (result includes: 5).
	self assert: (result includes: 6).
	self assert: (result includes: 7).
	self assert: (result includes: 8)
]
