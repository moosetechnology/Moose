Class {
	#name : #RTLazyMetricNormalizerTest,
	#superclass : #RTTest,
	#instVars : [
		'n'
	],
	#category : #'Roassal2-ColorNormalizer-Tests'
}

{ #category : #running }
RTLazyMetricNormalizerTest >> setUp [
	super setUp.
	n := RTLazyMetricNormalizer new.
]

{ #category : #tests }
RTLazyMetricNormalizerTest >> testBasic [
	n foo.
	n bar.
	self assert: n numberOfReceivedMessages equals: 2.
	
	n resetMessages.
	self assert: n numberOfReceivedMessages equals: 0.
]

{ #category : #tests }
RTLazyMetricNormalizerTest >> testBasic02 [
	| es |
	es := RTBox elementsOn: (1 to: 5).
	n elements: es.
	n normalizeSize: #yourself.
	
	self assert: es last trachelShape extent equals: 5 @ 5.

	n build.
	self assert: es last trachelShape extent equals: 30 @ 30.
]

{ #category : #tests }
RTLazyMetricNormalizerTest >> testBasic03ReuseOfMetrics [
	| es es2 |
	es := RTBox elementsOn: (1 to: 5).
	n elements: es.
	n normalizeSize: #yourself.
	n build.
	
	es2 := RTBox elementsOn: (1 to: 5).
	n elements: es2.
	n build.

	self assert: es2 last trachelShape extent equals: 30 @ 30.
]

{ #category : #tests }
RTLazyMetricNormalizerTest >> testDefault [

	self assert: n numberOfReceivedMessages equals: 0.
	n build.
]
