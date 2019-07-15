Class {
	#name : #TRVIAnimatedPointTest,
	#superclass : #TRTest,
	#instVars : [
		'pZero'
	],
	#category : #'Trachel-Viva'
}

{ #category : #running }
TRVIAnimatedPointTest >> setUp [
	super setUp.
	pZero := TRVIAnimatedPoint new.
]

{ #category : #tests }
TRVIAnimatedPointTest >> testAddToZero [
	| p |
	p := pZero + (1 @ 1).
	self assert: p x value equals: 1.
	self assert: p y value equals: 1.
]

{ #category : #tests }
TRVIAnimatedPointTest >> testZero [

	self assert: pZero x value equals: 0.
	self assert: pZero y value equals: 0.
]
