"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalDendrogramTest,
	#superclass : #TestCase,
	#instVars : [
		'dendrogram'
	],
	#category : #'Moose-Tests-Algos-Clustering'
}

{ #category : #running }
MalDendrogramTest >> setUp [
	
	| ab cd ef abcd efg |
	super setUp.
	ab := (MalDendrogram with: #a)
		merge: (MalDendrogram with: #b)
		at: 1.
	cd := (MalDendrogram with: #c)
		merge: (MalDendrogram with: #d)
		at: 2.
	ef := (MalDendrogram with: #e)
		merge: (MalDendrogram with: #f)
		at: 3.
	abcd := ab merge: cd at: 4.
	efg := ef
		merge: (MalDendrogram with: #g)
		at: 5.
	dendrogram := abcd merge: efg at: 7	"#(((a 1 b) 4 (c 2 d)) 7 ((e 3 f) 5 g))"
]

{ #category : #test }
MalDendrogramTest >> testAllLeaves [
	self assert: dendrogram elements size equals: 7.
	self assert: (dendrogram elements equalsTo: #(#a #b #c #d #e #f #g))
]

{ #category : #test }
MalDendrogramTest >> testIndex [
	self assert: dendrogram index equals: 1.
	self assert: dendrogram left index equals: 1.
	self assert: dendrogram right index equals: 5.
	self assert: dendrogram left left index equals: 1.
	self assert: dendrogram left right index equals: 3.
	self assert: dendrogram right left index equals: 5.
	self assert: dendrogram right right index equals: 7
]

{ #category : #test }
MalDendrogramTest >> testSize [
	self assert: dendrogram size equals: 7.
	self assert: dendrogram left size equals: 4.
	self assert: dendrogram right size equals: 3.
	self assert: dendrogram left left size equals: 2.
	self assert: dendrogram left right size equals: 2.
	self assert: dendrogram right left size equals: 2.
	self assert: dendrogram right right size equals: 1
]
