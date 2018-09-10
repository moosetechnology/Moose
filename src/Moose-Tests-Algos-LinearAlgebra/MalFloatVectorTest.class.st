"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalFloatVectorTest,
	#superclass : #MalVectorTest,
	#category : #'Moose-Tests-Algos-LinearAlgebra'
}

{ #category : #fixture }
MalFloatVectorTest >> testQuotient [
	
	^true	"the notorious equality problem with floats"
]

{ #category : #test }
MalFloatVectorTest >> testStoreDenseTextOn [
	
	^true	"when comparing text 0 is not 0.0"
]

{ #category : #fixture }
MalFloatVectorTest >> vectorClass [
	
	^MalFloatVector
]
