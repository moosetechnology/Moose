"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalSparseColumnMatrix,
	#superclass : #MalColumnMatrix,
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalSparseColumnMatrix class >> onColumns: columnCollection [
	
	| new |
	new := self basicNew.
	new
		instVarNamed: 'columns'
		put: columnCollection asArray.
	[new checkInvariant] assert.
	^new
]

{ #category : #private }
MalSparseColumnMatrix class >> vectorSpecies [
	
	^MalSparseVector
]

{ #category : #adding }
MalSparseColumnMatrix >> addColumn [
	
	columns := columns copyWith: (self vectorSpecies new: self rowSize)
]

{ #category : #adding }
MalSparseColumnMatrix >> addRow [
	
	columns do: #addLast
]

{ #category : #enumerating }
MalSparseColumnMatrix >> doSparseWithIndices: trinaryBlock [
	
	columns
		doWithIndex:
			[:vector :column | 
			vector
				doSparseWithIndex:
					[:each :row | trinaryBlock value: each value: row value: column]].
	^self
]

{ #category : #testing }
MalSparseColumnMatrix >> isZeroAt: row and: column [
	
	^(columns at: column) isZeroAt: row
]

{ #category : #accessing }
MalSparseColumnMatrix >> sparseSize [
	
	^columns
		inject: 0
		into: [:sum :each | sum + each sparseSize]
]

{ #category : #printing }
MalSparseColumnMatrix >> storeOn: stream [
	
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
