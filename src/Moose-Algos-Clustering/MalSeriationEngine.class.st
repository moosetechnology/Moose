"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalSeriationEngine,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'Moose-Algos-Clustering'
}

{ #category : #'instance creation' }
MalSeriationEngine class >> applyOn: elements [
	
	^(self with: elements) defaultAlgorithm
]

{ #category : #'instance creation' }
MalSeriationEngine class >> with: elements [
	
	^(self new)
		elements: elements;
		yourself
]

{ #category : #algorithm }
MalSeriationEngine >> defaultAlgorithm [
	
	^self orderDendrogramLeaves
]

{ #category : #accessing }
MalSeriationEngine >> elements [
	
	^elements
]

{ #category : #accessing }
MalSeriationEngine >> elements: anObject [
	
	elements := anObject
]

{ #category : #algorithm }
MalSeriationEngine >> orderDendrogramLeaves [
	
	| clusty |
	clusty := MalClusterEngine with: elements.
	clusty hierarchicalClusteringUsing: #averageLinkage.
	^clusty dendrogram orderLeafs asArray
]
