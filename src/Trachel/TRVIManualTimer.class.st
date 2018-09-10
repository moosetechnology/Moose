"
[ [ [ 
	| v timer t e |
	v := RTView new.

	timer := VIManualTimer new.

	t := VIAnimatedValue new.
	t evaluator: [ :time | 0 interpolateTo: 100 at: time ].
	t timer: timer.
	
	e := (RTEllipse new size: 30) element.

	v add: e.
	e translateTo: t @ t.

	v addMenu: 'refresh' callback: [ timer incrementBy: 0.1. v signalUpdate ].
	v
 ] ] ]
"
Class {
	#name : #TRVIManualTimer,
	#superclass : #TRVIBasicTimer,
	#instVars : [
		'value'
	],
	#category : #'Trachel-Viva'
}

{ #category : #actions }
TRVIManualTimer >> incrementBy: aDelta [
	value := (value + aDelta) \\ 1
]

{ #category : #initialization }
TRVIManualTimer >> initialize [
	super initialize.
	value := 0.0
]

{ #category : #accessing }
TRVIManualTimer >> value [
	^ value
]

{ #category : #accessing }
TRVIManualTimer >> value: aFloat [
	self assert: [ aFloat >= 0.0 and: [ aFloat <= 1.0 ] ] description: 'Must provide a value between 0 and 1'.
	value := aFloat
]
