"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalVectorDecorator,
	#superclass : #MalVector,
	#instVars : [
		'vector'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalVectorDecorator class >> on: aVector [
	
	^(self basicNew)
		setVector: aVector asVector;
		yourself
]

{ #category : #accessing }
MalVectorDecorator >> at: index [
	
	^vector at: index
]

{ #category : #accessing }
MalVectorDecorator >> at: index put: aNumber [
	
	^vector at: index put: aNumber
]

{ #category : #'initialize-release' }
MalVectorDecorator >> initializeSize: aSize [
	
	^self shouldNotImplement
]

{ #category : #'initialize-release' }
MalVectorDecorator >> setVector: aVector [
	
	^vector := aVector
]

{ #category : #accessing }
MalVectorDecorator >> size [
	
	^vector size
]

{ #category : #private }
MalVectorDecorator >> species [
	
	^vector species
]
