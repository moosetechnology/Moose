"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalArrayMatrixTest,
	#superclass : #MalMatrixTest,
	#category : #'Moose-Tests-Algos-LinearAlgebra'
}

{ #category : #fixture }
MalArrayMatrixTest >> matrixClass [
	
	^MalArrayMatrix
]

{ #category : #test }
MalArrayMatrixTest >> testDeterminant [
	| matrix |
	matrix := MalArrayMatrix rows: 3 columns: 3.
	self assertBlock: [ matrix determinant ] raises: AssertionFailure.
	matrix := MalArrayMatrix rows: 2 columns: 2 withAll: #(3 6 9 2).
	self assert: matrix determinant equals: -48
]
