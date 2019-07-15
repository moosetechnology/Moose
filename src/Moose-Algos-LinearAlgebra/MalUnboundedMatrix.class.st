"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalUnboundedMatrix,
	#superclass : #MalMatrixDecorator,
	#instVars : [
		'backgroundValue'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalUnboundedMatrix class >> on: matrix with: defaultValue [
	
	^(self on: matrix)
		backgroundValue: defaultValue;
		yourself
]

{ #category : #'initialize-release' }
MalUnboundedMatrix >> at: row and: column [
	
	^[matrix at: row and: column]
		on: "SubscriptOutOfBoundsError" Error
		do: [:ex | backgroundValue]
]

{ #category : #'initialize-release' }
MalUnboundedMatrix >> at: row and: column put: aNumber [
	
	^[matrix at: row and: column put: aNumber]
		on: "SubscriptOutOfBoundsError" Error
		do: [:ex | backgroundValue]
]

{ #category : #accessing }
MalUnboundedMatrix >> backgroundValue [
	
	^backgroundValue
]

{ #category : #accessing }
MalUnboundedMatrix >> backgroundValue: anObject [
	
	backgroundValue := anObject
]
