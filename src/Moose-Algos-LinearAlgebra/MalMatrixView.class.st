"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalMatrixView,
	#superclass : #MalMatrixDecorator,
	#instVars : [
		'rowSize',
		'columnSize',
		'mapBlock'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalMatrixView class >> from: top to: bottom on: matrix [
	
	^(self new: bottom - top + 1)
		setMatrix: matrix;
		setMapBlock: [:row :column | row @ column - top + 1];
		yourself
]

{ #category : #'As yet unclassified' }
MalMatrixView class >> fromColumn: start to: end on: matrix [
	
	^self
		from: 1
		to: matrix rowSize @ end
		on: matrix
]

{ #category : #'instance creation' }
MalMatrixView class >> transposeOn: matrix [
	
	^(self new: matrix dimension transpose)
		setMatrix: matrix;
		setMapBlock: [:row :column | column @ row];
		yourself
]

{ #category : #accessing }
MalMatrixView >> at: row and: column [
	
	^matrix atPoint: (mapBlock value: row value: column)
]

{ #category : #accessing }
MalMatrixView >> at: row and: column put: aNumber [
	
	self noModificationError
]

{ #category : #accessing }
MalMatrixView >> columnSize [
	
	^columnSize
]

{ #category : #'initialize-release' }
MalMatrixView >> initializeRows: m columns: n [
	
	rowSize := m.
	columnSize := n
]

{ #category : #accessing }
MalMatrixView >> rowSize [
	
	^rowSize
]

{ #category : #'initialize-release' }
MalMatrixView >> setMapBlock: block [
	
	^mapBlock := block
]
