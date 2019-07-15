"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalFloatVectorTest,
	#superclass : #MalVectorTest,
	#category : #'Moose-Algos-LinearAlgebra-Tests'
}

{ #category : #test }
MalFloatVectorTest >> testQuotient [
	"the notorious equality problem with floats"

	self assert: true
]

{ #category : #test }
MalFloatVectorTest >> testStoreDenseTextOn [
	"when comparing text 0 is not 0.0"

	self assert: true
]

{ #category : #fixture }
MalFloatVectorTest >> vectorClass [
	
	^MalFloatVector
]
