"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalMatrixCoercionTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Algos-LinearAlgebra'
}

{ #category : #test }
MalMatrixCoercionTest >> testDouble [
	"no longer Double in Pharo"
	"| m n |
	m := MAColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 2.0d.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m"
]

{ #category : #test }
MalMatrixCoercionTest >> testFixedPoint [
	"no longer FixedPoint in Pharo"
	"| m n |
	m := MAColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 2.0s.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m"
]

{ #category : #test }
MalMatrixCoercionTest >> testFloat [
	
	| m n |
	m := MalColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 2.0.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m
]

{ #category : #test }
MalMatrixCoercionTest >> testFraction [
	
	| m n |
	m := MalColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 1 / 2.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m
]

{ #category : #test }
MalMatrixCoercionTest >> testInteger [
	
	| m n |
	m := MalColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 2.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m
]

{ #category : #test }
MalMatrixCoercionTest >> testLargeInteger [
	
	| m n |
	m := MalColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 2000000000000.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m
]

{ #category : #test }
MalMatrixCoercionTest >> testPoint [
	
	| m n |
	m := MalColumnMatrix
		new: 4 @ 3
		withAll: 2.
	n := 2 @ 2.
	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.
	m / n.
	n / m
]
