"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalAccumulatorTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Algos-LinearAlgebra'
}

{ #category : #test }
MalAccumulatorTest >> testAverage [
	| a |
	a := MalAccumulator sum.
	a accumulate: 10.
	self assert: a average equals: 10.
	a accumulate: 1.
	self assert: a average equals: 11 / 2.
	a accumulate: 100.
	self assert: a average equals: 111 / 3
]

{ #category : #test }
MalAccumulatorTest >> testCustomBlock [
	| a |
	a := MalAccumulator value: 0 using: [ :current :new | current max: new size ].
	a accumulate: 'ab'.
	self assert: a value equals: 2.
	a accumulate: 'a'.
	self assert: a value equals: 2.
	a accumulate: 'abc'.
	self assert: a value equals: 3
]

{ #category : #test }
MalAccumulatorTest >> testEnumerate [
	| a |
	a := MalAccumulator minimum.
	a enumerate: #(10 1 100).
	self assert: a value equals: 1
]

{ #category : #test }
MalAccumulatorTest >> testEnumerateWithIndex [
	| a |
	a := MalAccumulator minimum.
	a enumerateWithIndex: #(10 1 100).
	self assert: a index equals: 2.
	self assert: a value equals: 1
]

{ #category : #test }
MalAccumulatorTest >> testIfTruePut [
	| a |
	a := MalAccumulator maximum.
	a accumulate: 10 withIndex: 'first'.
	self assert: a index equals: 'first'.
	self assert: a value equals: 10.
	a accumulate: 1 withIndex: 'second'.
	self assert: a index equals: 'first'.
	self assert: a value equals: 10.
	a accumulate: 100 withIndex: 'third'.
	self assert: a index equals: 'third'.
	self assert: a value equals: 100
]

{ #category : #test }
MalAccumulatorTest >> testMaximum [
	| a |
	a := MalAccumulator maximum.
	a accumulate: 10.
	self assert: a value equals: 10.
	a accumulate: 1.
	self assert: a value equals: 10.
	a accumulate: 100.
	self assert: a value equals: 100
]

{ #category : #test }
MalAccumulatorTest >> testMinimum [
	| a |
	a := MalAccumulator minimum.
	a accumulate: 10.
	self assert: a value equals: 10.
	a accumulate: 1.
	self assert: a value equals: 1.
	a accumulate: 100.
	self assert: a value equals: 1
]

{ #category : #test }
MalAccumulatorTest >> testSquaredSum [
	| a |
	a := MalAccumulator squaredSum.
	a enumerate: #(1 2 3 4 5 6 7 8 9 10).
	self assert: a value equals: 385
]

{ #category : #test }
MalAccumulatorTest >> testSum [
	| a |
	a := MalAccumulator sum.
	a enumerate: #(1 2 3 4 5 6 7 8 9 10).
	self assert: a value equals: 55
]
