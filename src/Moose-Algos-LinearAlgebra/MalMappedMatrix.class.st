"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalMappedMatrix,
	#superclass : #MalMatrixDecorator,
	#instVars : [
		'columnMap',
		'rowMap'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalMappedMatrix class >> on: aMatrix [
	
	^self on: aMatrix rowMap: nil columnMap: nil
]

{ #category : #'instance creation' }
MalMappedMatrix class >> on: aMatrix columnMap: columnReindexing [
	
	^self on: aMatrix rowMap: nil columnMap: columnReindexing
]

{ #category : #'instance creation' }
MalMappedMatrix class >> on: aMatrix map: aReindexing [
	
	[aMatrix isSquare] assert.
	^self on: aMatrix rowMap: aReindexing columnMap: aReindexing
]

{ #category : #'instance creation' }
MalMappedMatrix class >> on: aMatrix rowMap: rowReindexing [
	
	^self on: aMatrix rowMap: rowReindexing columnMap: nil
]

{ #category : #'instance creation' }
MalMappedMatrix class >> on: aMatrix rowMap: rowReindexing columnMap: columnReindexing [
	
	^(super on: aMatrix)
		setRowMap: rowReindexing;
		setColumnMap: columnReindexing;
		yourself
]

{ #category : #accessing }
MalMappedMatrix >> at: row and: column [
	
	^matrix
		at: (rowMap at: row)
		and: (columnMap at: column)
]

{ #category : #accessing }
MalMappedMatrix >> at: row and: column put: aNumber [
	
	^matrix
		at: (rowMap at: row)
		and: (columnMap at: column)
		put: aNumber
]

{ #category : #accessing }
MalMappedMatrix >> columnSize [
	
	^columnMap size
]

{ #category : #accessing }
MalMappedMatrix >> rowSize [
	
	^rowMap size
]

{ #category : #'initialize-release' }
MalMappedMatrix >> setColumnMap: mapping [
	
	columnMap := mapping ifNil: [MalNumberMapping new: matrix columnSize]
]

{ #category : #'initialize-release' }
MalMappedMatrix >> setRowMap: mapping [
	
	rowMap := mapping ifNil: [MalNumberMapping new: matrix rowSize]
]
