"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalClusterEngine,
	#superclass : #Object,
	#instVars : [
		'distanceMatrix',
		'dendrogram'
	],
	#category : #'Moose-Algos-Clustering'
}

{ #category : #examples }
MalClusterEngine class >> numbers: aCollection [
	"MalClusterEngine numbers: #(1 2 9 0 7 2 4 3)"

	^ (self with: aCollection using: [ :a :b | (a - b) * (a - b) ]) averageLinkage elements
]

{ #category : #'instance creation' }
MalClusterEngine class >> with: aCollection [
	^ self withDistanceMatrix: (MalDistanceSquare on: aCollection)
]

{ #category : #'instance creation' }
MalClusterEngine class >> with: aCollection using: aDistanceBlock [
	^ self withDistanceMatrix: (MalDistanceSquare on: aCollection using: aDistanceBlock)
]

{ #category : #'instance creation' }
MalClusterEngine class >> withDistanceMatrix: distanceMatrix [
	^ self new
		distanceMatrix: distanceMatrix;
		yourself
]

{ #category : #clustering }
MalClusterEngine >> averageLinkage [
	^ self performClustering: #averageLinkage
]

{ #category : #clustering }
MalClusterEngine >> completeLinkage [
	^ self performClustering: #completeLinkage
]

{ #category : #accessing }
MalClusterEngine >> dendrogram [
	^ dendrogram ifNil: [ dendrogram := self averageLinkage ]
]

{ #category : #accessing }
MalClusterEngine >> distanceMatrix [
	^ distanceMatrix
]

{ #category : #accessing }
MalClusterEngine >> distanceMatrix: anObject [
	distanceMatrix := anObject
]

{ #category : #'private - deprecated' }
MalClusterEngine >> hierarchicalClusteringShowProgressUsing: selector [
	self deprecated: 'Uses #hierarchicalClusteringUsing: instead'.
	^ self hierarchicalClusteringUsing: selector
]

{ #category : #'private - deprecated' }
MalClusterEngine >> hierarchicalClusteringUsing: selector [
	^ self performClustering: selector
]

{ #category : #accessing }
MalClusterEngine >> items [
	^ distanceMatrix items
]

{ #category : #clustering }
MalClusterEngine >> performClustering: linkageSelector [
	^ dendrogram := (MalClusteringData onDistanceSquare: distanceMatrix) performClustering: linkageSelector
]

{ #category : #clustering }
MalClusterEngine >> singleLinkage [
	^ self performClustering: #singleLinkage
]
