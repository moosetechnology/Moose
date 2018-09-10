"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalCorrelationSquare,
	#superclass : #MalDistanceSquare,
	#category : #'Moose-Algos-Clustering'
}

{ #category : #constants }
MalCorrelationSquare class >> defaultDistanceBlock [
	
	^[:a :b | a similarity: b]
]

{ #category : #private }
MalCorrelationSquare class >> vectorSpecies [
	
	^MalCorrelationVector
]

{ #category : #private }
MalCorrelationSquare >> copyClusteringData [
	
	^partialColumns collect: [:each | each negated]
]
