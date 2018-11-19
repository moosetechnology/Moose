"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalDendrogramNode,
	#superclass : #MalDendrogram,
	#instVars : [
		'left',
		'right',
		'threshold'
	],
	#category : #'Moose-Algos-Clustering'
}

{ #category : #'instance creation' }
MalDendrogramNode class >> with: left with: right at: threshold [
	^ self new
		left: left;
		right: right;
		threshold: threshold;
		yourself
]

{ #category : #enumerating }
MalDendrogramNode >> elementsDo: aBlock [
	
	left elementsDo: aBlock.
	right elementsDo: aBlock
]

{ #category : #enumerating }
MalDendrogramNode >> leavesDo: aBlock [
	
	left leavesDo: aBlock.
	right leavesDo: aBlock
]

{ #category : #accessing }
MalDendrogramNode >> left [
	
	^left
]

{ #category : #accessing }
MalDendrogramNode >> left: anObject [
	left := anObject.
	anObject parent: self
]

{ #category : #enumerating }
MalDendrogramNode >> nodesDo: aBlock [
	
	aBlock value: self.
	left nodesDo: aBlock.
	right nodesDo: aBlock
]

{ #category : #seriation }
MalDendrogramNode >> orderLeafs [
	
	| a b c d array |
	a := self left left.
	b := self left right.
	c := self right left.
	d := self right right.
	array := Array
		with: (a dist: c) -> [self left swap]
		with:
			(a dist: d)
				->
					[self left swap.
					self right swap]
		with: (b dist: c) -> []
		with: (b dist: d) -> [self right swap].
		
	(array copy sort: [:el1 :el2 | el1 key < el2 key]) first value value.
	self left orderLeafs.
	self right orderLeafs
]

{ #category : #accessing }
MalDendrogramNode >> right [
	
	^right
]

{ #category : #accessing }
MalDendrogramNode >> right: anObject [
	right := anObject.
	anObject parent: self
]

{ #category : #accessing }
MalDendrogramNode >> size [
	
	^left size + right size
]

{ #category : #seriation }
MalDendrogramNode >> swap [
	
	| swap |
	swap := left.
	left := right.
	right := swap
]

{ #category : #accessing }
MalDendrogramNode >> threshold [
	
	^threshold
]

{ #category : #accessing }
MalDendrogramNode >> threshold: anObject [
	threshold := anObject
]
