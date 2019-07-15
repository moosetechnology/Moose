"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalDendrogramLeaf,
	#superclass : #MalDendrogram,
	#instVars : [
		'element'
	],
	#category : #'Moose-Algos-Clustering'
}

{ #category : #'instance creation' }
MalDendrogramLeaf class >> with: anElement [
	
	^(self new)
		instVarNamed: 'element' put: anElement;
		yourself
]

{ #category : #accessing }
MalDendrogramLeaf >> element [
	
	^element
]

{ #category : #enumerating }
MalDendrogramLeaf >> elementsDo: aBlock [
	
	aBlock value: element
]

{ #category : #enumerating }
MalDendrogramLeaf >> leavesDo: aBlock [
	
	aBlock value: self
]

{ #category : #accessing }
MalDendrogramLeaf >> left [
	
	^self
]

{ #category : #enumerating }
MalDendrogramLeaf >> nodesDo: aBlock [
	"does nothing"
	
	
]

{ #category : #seriation }
MalDendrogramLeaf >> orderLeafs [
	"do nothing"
	
	
]

{ #category : #accessing }
MalDendrogramLeaf >> right [
	
	^self
]

{ #category : #accessing }
MalDendrogramLeaf >> size [
	
	^1
]

{ #category : #seriation }
MalDendrogramLeaf >> swap [
	"does nothing"
	
	
]

{ #category : #accessing }
MalDendrogramLeaf >> threshold [
	
	^ Number zero
]
