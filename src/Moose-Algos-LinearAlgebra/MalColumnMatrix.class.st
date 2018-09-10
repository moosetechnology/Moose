"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalColumnMatrix,
	#superclass : #MalMatrix,
	#instVars : [
		'columns'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #accessing }
MalColumnMatrix >> at: row and: column [
	
	^(columns at: column) at: row
]

{ #category : #accessing }
MalColumnMatrix >> at: row and: column put: aNumber [
	
	^(columns at: column) at: row put: aNumber
]

{ #category : #private }
MalColumnMatrix >> checkInvariant [
	
	^columns isCollection
		and:
			[(columns allSatisfy: [:vector | vector isKindOf: self vectorSpecies])
				and: [columns allSatisfy: [:vector | vector size = self rowSize]]]
]

{ #category : #'accessing vectorwise' }
MalColumnMatrix >> columnAt: column [
	
	^columns at: column
]

{ #category : #accessing }
MalColumnMatrix >> columnSize [
	
	^columns size
]

{ #category : #'accessing vectorwise' }
MalColumnMatrix >> columns [
	
	^columns
]

{ #category : #'initialize-release' }
MalColumnMatrix >> initializeRows: m columns: n [
	
	columns := Array new: n.
	1
		to: n
		do:
			[:index | 
			columns
				at: index
				put: (self vectorSpecies new: m)]
]

{ #category : #accessing }
MalColumnMatrix >> rowSize [
	
	^columns isEmpty
		ifTrue: [0]
		ifFalse: [columns last size]
]
