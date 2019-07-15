"
A number animation to handle a number and interpolate between values
"
Class {
	#name : #RTNumberAnimation,
	#superclass : #RTAnimation,
	#instVars : [
		'time',
		'blockToExcute',
		'animatedValue',
		'afterBlock'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #accessing }
RTNumberAnimation >> after: aBlock [
	afterBlock := aBlock
]

{ #category : #api }
RTNumberAnimation >> during: seconds [
	time := TRVITimer new cycleLength: seconds.
]

{ #category : #refreshing }
RTNumberAnimation >> hasCompleted [
	| r |
	(r := animatedValue hasCompleted) 
		ifTrue: [ self refresh ].
	^ r
]

{ #category : #enumerating }
RTNumberAnimation >> onStepDo: aBlock [
	blockToExcute := aBlock
]

{ #category : #refreshing }
RTNumberAnimation >> refresh [
	blockToExcute value: animatedValue value
]

{ #category : #actions }
RTNumberAnimation >> start [
	animatedValue := TRVIAnimatedValue new
		timer: time;
		finishCallback: afterBlock;
		yourself.
	animatedValue start.
]
