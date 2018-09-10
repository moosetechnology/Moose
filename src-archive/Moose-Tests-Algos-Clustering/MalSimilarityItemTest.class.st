"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalSimilarityItemTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Algos-Clustering'
}

{ #category : #'As yet unclassified' }
MalSimilarityItemTest >> testDistance [
	| a b c elements engine clusters |
	a := MalVectorItem with: #a and: #(1 0).
	b := MalVectorItem with: #b and: #(0 1).
	c := MalVectorItem with: #c and: #(0 7).
	elements := Array with: a with: b with: c.
	engine := MalClusterEngine with: elements.
	engine hierarchicalClusteringUsing: #averageLinkage.
	clusters := engine dendrogram breakInto: 2.
	self assert: clusters size equals: 2.
	self assert: (clusters select: [ :each | each size = 1 ]) size equals: 1.
	self assert: (clusters select: [ :each | each size = 2 ]) size equals: 1.
	self assert: ((clusters select: [ :each | each size = 1 ]) first includes: c).
	self assert: ((clusters select: [ :each | each size = 2 ]) first includes: a).
	self assert: ((clusters select: [ :each | each size = 2 ]) first includes: b)
]

{ #category : #'As yet unclassified' }
MalSimilarityItemTest >> testSimilarity [
	| a b c elements engine clusters |
	a := MalSimilarityItem with: #a and: #(1 0).
	b := MalSimilarityItem with: #b and: #(0 1).
	c := MalSimilarityItem with: #c and: #(0 7).
	elements := Array with: a with: b with: c.
	engine := MalClusterEngine with: elements.
	engine hierarchicalClusteringUsing: #averageLinkage.
	clusters := engine dendrogram breakInto: 2.
	self assert: clusters size equals: 2.
	self assert: (clusters select: [ :each | each size = 1 ]) size equals: 1.
	self assert: (clusters select: [ :each | each size = 2 ]) size equals: 1.
	self assert: ((clusters select: [ :each | each size = 1 ]) first includes: a).
	self assert: ((clusters select: [ :each | each size = 2 ]) first includes: b).
	self assert: ((clusters select: [ :each | each size = 2 ]) first includes: c)
]
