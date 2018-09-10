"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalVectorTest,
	#superclass : #TestCase,
	#instVars : [
		'v',
		'w'
	],
	#category : #'Moose-Tests-Algos-LinearAlgebra'
}

{ #category : #testing }
MalVectorTest class >> isAbstract [
	
	^self name = #MalVectorTest
]

{ #category : #running }
MalVectorTest >> setUp [
	"comment stating purpose of message"
	super setUp.
	v := self vectorClass withAll: (1 to: 10).
	w := self vectorClass new: 10 withAll: -5
]

{ #category : #test }
MalVectorTest >> testAccessors [
	"comment stating purpose of message"
	
	v := self vectorClass new: 1.
	v at: 1 put: 77.
	self assert: (v at: 1) ~= 0.
	self assert: (v at: 1) ~= nil
]

{ #category : #test }
MalVectorTest >> testAccessors2 [
	"comment stating purpose of message"

	v := self vectorClass new: 3.
	v at: 1 put: 77.
	v at: 2 put: 23.
	v at: 3 put: 42.
	self assert: (v at: 1) equals: 77.
	self assert: (v at: 2) equals: 23.
	self assert: (v at: 3) equals: 42
]

{ #category : #test }
MalVectorTest >> testAccessors3 [
	"comment stating purpose of message"

	v := self vectorClass withAll: #(4 5 7).
	v at: 1 put: 77.
	v at: 2 put: 23.
	v at: 3 put: 42.
	self assert: (v at: 1) equals: 77.
	self assert: (v at: 2) equals: 23.
	self assert: (v at: 3) equals: 42
]

{ #category : #test }
MalVectorTest >> testAccessors4 [
	"comment stating purpose of message"

	v := self vectorClass withAll: #(4 5 7).
	v at: 1 put: 0.
	v at: 2 put: 0.
	v at: 3 put: 0.
	self assert: (v at: 1) equals: 0.
	self assert: (v at: 2) equals: 0.
	self assert: (v at: 3) equals: 0
]

{ #category : #test }
MalVectorTest >> testDifference [
	"comment stating purpose of message"

	self assert: v - 2 equals: (self vectorClass withAll: #(-1 0 1 2 3 4 5 6 7 8)).
	self assert: 2 - v equals: (self vectorClass withAll: #(1 0 -1 -2 -3 -4 -5 -6 -7 -8)).
	self assert: v - 2 equals: (2 - v) negated.	"no longer double in pharo"	"self assert: v - 2 = (v - 2.0d)."
	self assert: v - 2 equals: v - 2.0.
	v -= 2.
	self assert: v equals: (self vectorClass withAll: #(-1 0 1 2 3 4 5 6 7 8))
]

{ #category : #test }
MalVectorTest >> testDotProduct [
	"comment stating purpose of message"

	v := self vectorClass withAll: #(1 2 3).
	w := self vectorClass withAll: #(5 -11 7).
	self assert: (v dotProduct: w) equals: 1 * 5 + (2 * -11) + (3 * 7).
	self assert: (v dotProduct: v) equals: 1 * 1 + (2 * 2) + (3 * 3).
	self assert: (w dotProduct: w) equals: 5 * 5 + (11 * 11) + (7 * 7)
]

{ #category : #test }
MalVectorTest >> testLength [
	"comment stating purpose of message"

	v := self vectorClass withAll: #(1 2 3).
	w := self vectorClass withAll: #(5 -11 7).
	self assert: v length equals: (1 * 1 + (2 * 2) + (3 * 3)) sqrt.
	self assert: w length equals: (5 * 5 + (11 * 11) + (7 * 7)) sqrt
]

{ #category : #test }
MalVectorTest >> testNonZeroSize [
	v := self vectorClass new: 100 withAll: 0.
	self assert: v sparseSize equals: 0.
	v at: 23 put: 1.
	self assert: v sparseSize equals: 1.
	v at: 23 put: 0.
	self assert: v sparseSize equals: 0.
	v at: 17 put: 1.
	v at: 27 put: 2.
	v at: 77 put: 3.
	self assert: v sparseSize equals: 3.
	v at: 27 put: 4.
	self assert: v sparseSize equals: 3.
	v at: 17 put: 0.
	self assert: v sparseSize equals: 2.
	v at: 43 put: 0.
	self assert: v sparseSize equals: 2
]

{ #category : #test }
MalVectorTest >> testProduct [
	"comment stating purpose of message"

	self assert: v * 2 equals: (self vectorClass withAll: #(2 4 6 8 10 12 14 16 18 20)).
	self assert: v * 2 equals: 2 * v.	"no more double in Pharo"	"self assert: v * 2 = (v * 2.0d)."
	self assert: v * 2 equals: v * 2.0.
	v *= 2.
	self assert: v equals: (self vectorClass withAll: #(2 4 6 8 10 12 14 16 18 20))
]

{ #category : #test }
MalVectorTest >> testProductVector [
	"comment stating purpose of message"

	self assert: v * w equals: (self vectorClass withAll: #(-5 -10 -15 -20 -25 -30 -35 -40 -45 -50)).
	self assert: v * w equals: w * v
]

{ #category : #test }
MalVectorTest >> testQuotient [
	"comment stating purpose of message"

	self assert: v / 2 equals: (self vectorClass withAll: #(0.5 1 1.5 2 2.5 3 3.5 4 4.5 5)).
	self assert: (2 / v) first equals: 2.
	self assert: v / 2 equals: (2 / v) reciprocal.	"no longer double in pharo"	"self assert: v / 2 = (v / 2.0d)."
	self assert: v / 2 equals: v / 2.0.
	v /= 2.
	self assert: v equals: (self vectorClass withAll: #(0.5 1 1.5 2 2.5 3 3.5 4 4.5 5))
]

{ #category : #test }
MalVectorTest >> testReadDenseTextFrom [
	| vector text stream tmp |
	vector := MalArrayVector withAll: #(2.3 0 4.2 0 1.3 2.2 3.8 0 0.5 0 0 0).
	text := '12\2.3 0 4.2 0 1.3 2.2 3.8 0 0.5 0 0 0\' withCRs.
	stream := ReadStream on: text.
	self assert: vector equals: (tmp := self vectorClass readFromDenseText: stream)
]

{ #category : #test }
MalVectorTest >> testStoreDenseTextOn [
	| vector text stream |
	vector := self vectorClass withAll: #(2.3 0 4.2 0 1.3 2.2 3.8 0 0.5 0 0 0).
	text := '12\2.3 0 4.2 0 1.3 2.2 3.8 0 0.5 0 0 0\' withCRs.
	stream := WriteStream on: String new.
	vector storeDenseTextOn: stream.
	self assert: stream contents equals: text
]

{ #category : #test }
MalVectorTest >> testSum [
	"comment stating purpose of message"

	self assert: v + 2 equals: (self vectorClass withAll: #(3 4 5 6 7 8 9 10 11 12)).
	self assert: v + 2 equals: 2 + v.	"no longer double in pharo"	"self assert: v + 2 = (v + 2.0d)."
	self assert: v + 2 equals: v + 2.0.
	v += 2.
	self assert: v equals: (self vectorClass withAll: #(3 4 5 6 7 8 9 10 11 12))
]

{ #category : #test }
MalVectorTest >> testSumVector [
	"comment stating purpose of message"

	self assert: v + w equals: (self vectorClass withAll: #(-4 -3 -2 -1 0 1 2 3 4 5)).
	self assert: v + w equals: w + v
]

{ #category : #test }
MalVectorTest >> testUnitVector [
	"comment stating purpose of message"

	"no longer double in pharo"

	"self assert: v unitVector length asFloat = 1.0d asFloat.
	self assert: w unitVector length asFloat = 1.0d asFloat"

	| tmp |
	self assert: v unitVector length asFloat equals: 1.0	"here,something special in pharo. Those two floats have the same values but the egality test return false "	"self assert: (tmp := w unitVector length asFloat) = 1.0."
]

{ #category : #fixture }
MalVectorTest >> vectorClass [
	
	self subclassResponsibility
]
