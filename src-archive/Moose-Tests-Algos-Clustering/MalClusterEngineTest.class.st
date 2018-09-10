"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalClusterEngineTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Algos-Clustering'
}

{ #category : #testing }
MalClusterEngineTest >> testCentroid [
	| input clusty clusters |
	input := #(#(1 2 3 5) #(11 12 15) #(21 22 23 25) #(31 32 35) #(41 42 43 45 47)).
	clusty := MalClusterEngine with: input flatten shuffle.
	clusty hierarchicalClusteringUsing: #centroid.
	clusters := clusty dendrogram breakInto: 5.
	self assert: clusters size equals: 5.
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 1) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 2) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 3) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 4) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 5) ]).
	^ clusters
]

{ #category : #testing }
MalClusterEngineTest >> testClustering [
	| input clusty clusters |
	input := #(#(1 2 3 5) #(11 12 15) #(21 22 23 25) #(31 32 35) #(41 42 43 45 47)).
	clusty := MalClusterEngine with: input flatten shuffle.
	clusty hierarchicalClusteringUsing: #averageLinkage.
	clusters := clusty dendrogram breakInto: 5.
	self assert: clusters size equals: 5.
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 1) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 2) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 3) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 4) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 5) ]).
	^ clusters
]

{ #category : #testing }
MalClusterEngineTest >> testClustering2 [
	| input clusty clusters |
	input := #(#(1 2 3 5) #(11 12 15) #(21 22 23 25) #(31 32 35) #(41 42 43 45 47)).
	clusty := MalClusterEngine with: input flatten shuffle.
	clusty hierarchicalClusteringUsing: #centroid.
	clusters := clusty dendrogram breakInto: 5.
	self assert: clusters size equals: 5.
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 1) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 2) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 3) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 4) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 5) ]).
	^ clusters
]

{ #category : #testing }
MalClusterEngineTest >> testClustering300Elements [
	
	| input clusty clusters |
	input := Random new next: 300.
	clusty := MalClusterEngine with: input.
	1
		to: 1
		do: [:n | clusty averageLinkage].
	clusters := clusty dendrogram breakInto: 10.
	^clusters
]

{ #category : #testing }
MalClusterEngineTest >> testClusteringOptimization [
	
	| input clusty |
	input := Random new next: 200.
	clusty := MalClusteringData onDistanceSquare: (MalDistanceSquare on: input).	"internally compares the optimzed and the unoptimized code."
	clusty testPerformClustering: #averageLinkage
]

{ #category : #testing }
MalClusterEngineTest >> testSeriationEngine [
	
	| input output |
	input := #(1 2 3 5 11 12 15 21 22 23 25 31 32 35 41 42 43 45 47).
	output := MalSeriationEngine applyOn: input copy asArray shuffle.
	self assert: output = input | (output reverse = input)
]

{ #category : #testing }
MalClusterEngineTest >> testWardsMethod [
	| input clusty clusters |
	input := #(#(1 2 3 5) #(11 12 15) #(21 22 23 25) #(31 32 35) #(41 42 43 45 47)).
	clusty := MalClusterEngine with: input flatten shuffle.
	clusty hierarchicalClusteringUsing: #wardsMethod.
	clusters := clusty dendrogram breakInto: 5.
	self assert: clusters size equals: 5.
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 1) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 2) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 3) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 4) ]).
	self assert: (clusters contains: [ :each | each equalsTo: (input at: 5) ]).
	^ clusters
]
