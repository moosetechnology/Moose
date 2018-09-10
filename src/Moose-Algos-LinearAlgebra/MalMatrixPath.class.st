"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalMatrixPath,
	#superclass : #MalVector,
	#instVars : [
		'matrix',
		'mapBlock',
		'size'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalMatrixPath class >> column: columnIndex on: matrix [
	
	^(super new: matrix rowSize)
		setMatrix: matrix;
		setMapBlock: [:index | index @ columnIndex];
		yourself
]

{ #category : #'instance creation' }
MalMatrixPath class >> diagonalOn: matrix [
	
	[matrix isSquare] assert.
	^(super new: matrix columnSize)
		setMatrix: matrix;
		setMapBlock: [:index | index @ index];
		yourself
]

{ #category : #'instance creation' }
MalMatrixPath class >> row: rowIndex on: matrix [
	
	^(super new: matrix columnSize)
		setMatrix: matrix;
		setMapBlock: [:index | rowIndex @ index];
		yourself
]

{ #category : #accessing }
MalMatrixPath >> at: index [
	
	^matrix atPoint: (mapBlock value: index)
]

{ #category : #accessing }
MalMatrixPath >> at: index put: aNumber [
	
	^matrix
		atPoint: (mapBlock value: index)
		put: aNumber
]

{ #category : #'initialize-release' }
MalMatrixPath >> initializeSize: aSize [
	
	^size := aSize
]

{ #category : #'initialize-release' }
MalMatrixPath >> setMapBlock: aBlock [
	
	^mapBlock := aBlock
]

{ #category : #'initialize-release' }
MalMatrixPath >> setMatrix: aMatrix [
	
	^matrix := aMatrix
]

{ #category : #accessing }
MalMatrixPath >> size [
	
	^size
]

{ #category : #'initialize-release' }
MalMatrixPath >> species [
	
	^matrix vectorSpecies
]
