Class {
	#name : #TRVIAnimatedValueTest,
	#superclass : #TRTest,
	#category : #'Trachel-Viva'
}

{ #category : #tests }
TRVIAnimatedValueTest >> testAddingWithNumber [

	| t |
	t := TRVIAnimatedValue new.
	t evaluator: [ :timE | 5 ].

	self assert: t value equals: 5.
	self assert: (t value + 4) value equals: 9.
	self assert: (4 + t value) value equals: 9
]

{ #category : #tests }
TRVIAnimatedValueTest >> testBasic [
	| t |
	t := TRVIAnimatedValue new.
	t evaluator: [ :time1 | 0 interpolateTo: 100 at: time1 ].
	self assert: t value equals: 0
]

{ #category : #tests }
TRVIAnimatedValueTest >> testBasicWithOutEvaluator [
	| t  |
	t := TRVIAnimatedValue new.
	self assert: t value equals: 0
]

{ #category : #tests }
TRVIAnimatedValueTest >> testBasicWithTimer [
	| t timer |
	t := TRVIAnimatedValue new.
	t evaluator: [ :time1 | 0 interpolateTo: 100 at: time1 ].
	timer := TRVITimer new cycleLength: 2.
	t timer: timer.
	self assert: t value equals: 0
]

{ #category : #tests }
TRVIAnimatedValueTest >> testPoint [
	| t1 t2 p |
	t1 := TRVIAnimatedValue new.
	t2 := TRVIAnimatedValue new.
	p := t1 @ t2.
	self assert: p class equals: TRVIAnimatedPoint.
]
