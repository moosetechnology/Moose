"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalRowMatrix,
	#superclass : #MalMatrix,
	#instVars : [
		'rows'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #accessing }
MalRowMatrix >> at: row and: column [
	
	^(rows at: row) at: column
]

{ #category : #accessing }
MalRowMatrix >> at: row and: column put: aNumber [
	
	^(rows at: row) at: column put: aNumber
]

{ #category : #private }
MalRowMatrix >> checkInvariant [
	
	^rows isCollection
		and:
			[(rows allSatisfy: [:row | row isKindOf: self vectorSpecies])
				and: [rows allSatisfy: [:row | row size = self columnSize]]]
]

{ #category : #accessing }
MalRowMatrix >> columnSize [
	
	^rows isEmpty
		ifTrue: [0]
		ifFalse: [rows first size]
]

{ #category : #'initialize-release' }
MalRowMatrix >> initializeRows: m columns: n [
	
	rows := Array new: m.
	1
		to: m
		do:
			[:index | 
			rows
				at: index
				put: (self vectorSpecies new: n)]
]

{ #category : #'accessing vectorwise' }
MalRowMatrix >> rowAt: rowIndex [
	
	^rows at: rowIndex
]

{ #category : #accessing }
MalRowMatrix >> rowSize [
	
	^rows size
]

{ #category : #'accessing vectorwise' }
MalRowMatrix >> rows [
	
	^rows
]
