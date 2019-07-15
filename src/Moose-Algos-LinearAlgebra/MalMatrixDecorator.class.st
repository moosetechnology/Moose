"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalMatrixDecorator,
	#superclass : #MalMatrix,
	#instVars : [
		'matrix'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalMatrixDecorator class >> on: aMatrix [
	
	^(self basicNew)
		setMatrix: aMatrix;
		yourself
]

{ #category : #accessing }
MalMatrixDecorator >> at: row and: column [
	
	^matrix at: row and: column
]

{ #category : #accessing }
MalMatrixDecorator >> at: row and: column put: aNumber [
	
	^matrix at: row and: column put: aNumber
]

{ #category : #private }
MalMatrixDecorator >> checkInvariant [
	
	^matrix checkInvariant
]

{ #category : #accessing }
MalMatrixDecorator >> columnSize [
	
	^matrix columnSize
]

{ #category : #'initialize-release' }
MalMatrixDecorator >> initializeRows: m columns: n [
	
	self shouldNotImplement
]

{ #category : #accessing }
MalMatrixDecorator >> rowSize [
	
	^matrix rowSize
]

{ #category : #'initialize-release' }
MalMatrixDecorator >> setMatrix: aMatrix [
	
	^matrix := aMatrix
]

{ #category : #'initialize-release' }
MalMatrixDecorator >> species [
	
	^matrix species
]
