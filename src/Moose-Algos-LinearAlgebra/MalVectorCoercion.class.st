"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalVectorCoercion,
	#superclass : #MalVector,
	#instVars : [
		'number'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'initialize-release' }
MalVectorCoercion class >> with: aNumber [
	
	^(aNumber isKindOf: MalVector)
		ifTrue: [aNumber]
		ifFalse:
			[(self basicNew)
				setNumber: aNumber;
				yourself]
]

{ #category : #converting }
MalVectorCoercion >> asNumber [
	
	^number
]

{ #category : #accessing }
MalVectorCoercion >> at: index [
	
	^number
]

{ #category : #testing }
MalVectorCoercion >> hasSize: aSize [
	
	^true
]

{ #category : #'initialize-release' }
MalVectorCoercion >> initializeSize: aSize [
	
	^self noDimensionError
]

{ #category : #private }
MalVectorCoercion >> noDimensionError [
	
	^self error: 'Coerced matrices do not have dimension.'
]

{ #category : #printing }
MalVectorCoercion >> printOn: aStream [
	
	aStream
		print: self class;
		nextPutAll: ' with: ';
		print: number
]

{ #category : #'initialize-release' }
MalVectorCoercion >> setNumber: aNumber [
	
	^number := aNumber
]

{ #category : #accessing }
MalVectorCoercion >> size [
	
	^self noDimensionError
]

{ #category : #'mathematical functions' }
MalVectorCoercion >> sum [
	
	^self noDimensionError
]

{ #category : #private }
MalVectorCoercion >> switch: matrix caseCoercion: coercionBlock caseVector: vectorBlock [
	
	^(matrix isKindOf: MalVectorCoercion)
		ifTrue: [coercionBlock value]
		ifFalse: [vectorBlock value]
]

{ #category : #enumerating }
MalVectorCoercion >> with: vector affect: aBlock [
	
	^self
		switch: vector
		caseCoercion:
			[number := aBlock
				value: number
				value: vector asNumber]
		caseVector: [Error raise]
]

{ #category : #enumerating }
MalVectorCoercion >> with: vector collect: aBlock [
	
	^self
		switch: vector
		caseCoercion:
			[MalMatrixCoercion
				with:
					(aBlock
						value: number
						value: vector asNumber)]
		caseVector:
			[vector
				with: self
				collect: [:a :b | aBlock value: b value: a]]
]

{ #category : #enumerating }
MalVectorCoercion >> with: vector do: aBlock [
	
	^self
		switch: vector
		caseCoercion:
			[aBlock
				value: number
				value: vector asNumber]
		caseVector:
			[vector
				with: self
				do: [:a :b | aBlock value: b value: a]]
]
