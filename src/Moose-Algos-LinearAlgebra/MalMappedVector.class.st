"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalMappedVector,
	#superclass : #MalVectorDecorator,
	#instVars : [
		'indices'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalMappedVector class >> on: aVector [
	
	^self on: aVector indices: nil
]

{ #category : #'instance creation' }
MalMappedVector class >> on: aVector indices: aReindexing [
	
	^(super on: aVector)
		setIndices: aReindexing;
		yourself
]

{ #category : #accessing }
MalMappedVector >> at: anIndex [
	
	^vector at: (indices at: anIndex)
]

{ #category : #accessing }
MalMappedVector >> at: anIndex put: aNumber [
	
	^vector
		at: (indices at: anIndex)
		put: aNumber
]

{ #category : #'initialize-release' }
MalMappedVector >> setIndices: aReindexing [
	
	indices := aReindexing ifNil: [MalNumberMapping new: vector size]
]

{ #category : #accessing }
MalMappedVector >> size [
	
	^indices size
]
