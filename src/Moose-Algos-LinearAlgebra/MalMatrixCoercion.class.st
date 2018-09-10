"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalMatrixCoercion,
	#superclass : #MalMatrix,
	#instVars : [
		'number'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'initialize-release' }
MalMatrixCoercion class >> with: aNumber [
	
	^(aNumber isKindOf: MalMatrix)
		ifTrue: [aNumber]
		ifFalse:
			[(self basicNew)
				setNumber: aNumber;
				yourself]
]

{ #category : #comparing }
MalMatrixCoercion >> = matrix [
	
	^self
		switch: matrix
		caseCoercion: [number = matrix asNumber]
		caseMatrix: [matrix = self]
]

{ #category : #converting }
MalMatrixCoercion >> asNumber [
	
	^number
]

{ #category : #accessing }
MalMatrixCoercion >> at: row and: column [
	
	^number
]

{ #category : #private }
MalMatrixCoercion >> checkInvariant [
	
	^number respondsToArithmetic
]

{ #category : #accessing }
MalMatrixCoercion >> columnSize [
	
	self noDimensionError
]

{ #category : #testing }
MalMatrixCoercion >> hasDimension: aDimension [
	
	^true
]

{ #category : #'initialize-release' }
MalMatrixCoercion >> initializeRows: m columns: n [
	
	^self noDimensionError
]

{ #category : #private }
MalMatrixCoercion >> noDimensionError [
	
	^self error: 'Coerced matrices do not have dimension.'
]

{ #category : #printing }
MalMatrixCoercion >> printOn: aStream [
	"Append to the argument aStream a sequence of characters that identifies the matrix."
	
	aStream
		print: self class;
		nextPutAll: ' with: ';
		print: number
]

{ #category : #accessing }
MalMatrixCoercion >> rowSize [
	
	self noDimensionError
]

{ #category : #'initialize-release' }
MalMatrixCoercion >> setNumber: aNumber [
	
	^number := aNumber
]

{ #category : #private }
MalMatrixCoercion >> switch: matrix caseCoercion: coercionBlock caseMatrix: matrixBlock [
	
	^(matrix isKindOf: MalMatrixCoercion)
		ifTrue: [coercionBlock value]
		ifFalse: [matrixBlock value]
]

{ #category : #enumerating }
MalMatrixCoercion >> with: matrix affect: aBlock [
	
	^self
		switch: matrix
		caseCoercion:
			[number := aBlock
				value: number
				value: matrix asNumber]
		caseMatrix: [Error raise]
]

{ #category : #enumerating }
MalMatrixCoercion >> with: matrix collect: aBlock [
	
	^self
		switch: matrix
		caseCoercion:
			[MalMatrixCoercion
				with:
					(aBlock
						value: number
						value: matrix asNumber)]
		caseMatrix:
			[matrix
				with: self
				collect: [:a :b | aBlock value: b value: a]]
]

{ #category : #enumerating }
MalMatrixCoercion >> with: matrix do: aBlock [
	
	^self
		switch: matrix
		caseCoercion:
			[aBlock
				value: number
				value: matrix asNumber]
		caseMatrix:
			[matrix
				with: self
				do: [:a :b | aBlock value: b value: a]]
]
