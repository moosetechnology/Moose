"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalSparseRowMatrix,
	#superclass : #MalRowMatrix,
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #private }
MalSparseRowMatrix class >> onRows: rowCollection [
	
	| new |
	new := self basicNew.
	new
		instVarNamed: 'rows'
		put: rowCollection asArray.
	[new checkInvariant] assert.
	^new
]

{ #category : #private }
MalSparseRowMatrix class >> vectorSpecies [
	
	^MalSparseVector
]

{ #category : #adding }
MalSparseRowMatrix >> addColumn [
	
	rows do: #addLast
]

{ #category : #adding }
MalSparseRowMatrix >> addRow [
	
	rows := rows copyWith: (self vectorSpecies new: self columnSize)
]

{ #category : #enumerating }
MalSparseRowMatrix >> doSparseWithIndices: trinaryBlock [
	
	rows
		doWithIndex:
			[:vector :row | 
			vector
				doSparseWithIndex:
					[:each :column | trinaryBlock value: each value: row value: column]].
	^self
]

{ #category : #testing }
MalSparseRowMatrix >> isZeroAt: row and: column [
	
	^(rows at: row) isZeroAt: column
]

{ #category : #accessing }
MalSparseRowMatrix >> sparseSize [
	
	^rows
		inject: 0
		into: [:sum :each | sum + each sparseSize]
]

{ #category : #printing }
MalSparseRowMatrix >> storeOn: stream [
	
	| text |
	text := String new writeStream.
	self storeSparseTextOn: text.
	stream
		print: self class;
		space;
		nextPutAll: #readFromSparseText:;
		space;
		print:
				(text contents
						replaceAll: Character cr
						with: Character space);
		space;
		nextPutAll: 'readStream'
]
