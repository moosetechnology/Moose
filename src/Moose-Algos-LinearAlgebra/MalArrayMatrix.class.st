"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalArrayMatrix,
	#superclass : #MalMatrix,
	#instVars : [
		'array',
		'columnSize',
		'rowSize'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #accessing }
MalArrayMatrix >> at: row and: column [
	
	^array at: (row - 1) * self columnSize + column
]

{ #category : #accessing }
MalArrayMatrix >> at: row and: column put: aNumber [
	
	^array
		at: (row - 1) * self columnSize + column
		put: aNumber
]

{ #category : #private }
MalArrayMatrix >> checkInvariant [
	
	^array isCollection and: [(array size = rowSize) * columnSize]
]

{ #category : #accessing }
MalArrayMatrix >> columnSize [
	
	^columnSize
]

{ #category : #'initialize-release' }
MalArrayMatrix >> initializeRows: n columns: m [
	
	rowSize := n.
	columnSize := m.
	array := Array new: n * m.
	^self
]

{ #category : #accessing }
MalArrayMatrix >> rowSize [
	
	^rowSize
]
