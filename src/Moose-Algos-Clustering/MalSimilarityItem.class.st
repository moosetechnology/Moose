"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalSimilarityItem,
	#superclass : #MalVectorItem,
	#category : #'Moose-Algos-Clustering'
}

{ #category : #'vector functions' }
MalSimilarityItem >> dist: anItem [
	"I define the distance between myself and anItem as the opposite of the cosine similarity."
	^1 - (self vector cosine: anItem vector)
]

{ #category : #'distance functions' }
MalSimilarityItem >> similarity: anItem [
	
	^self vector cosine: anItem vector
]
