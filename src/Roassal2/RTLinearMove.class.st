"
A RTLinearMove linearly and at a regular speed move the element on which the animation is invoked on
"
Class {
	#name : #RTLinearMove,
	#superclass : #RTAnimation,
	#instVars : [
		'animatedValue'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #'as yet unclassified' }
RTLinearMove class >> to: endPoint during: seconds on: shape [
	^ self new to: endPoint during: seconds on: shape
]

{ #category : #accessing }
RTLinearMove >> after: aBlock [
	animatedValue finishCallback: aBlock
]

{ #category : #public }
RTLinearMove >> by: aDeltaPoint during: seconds on: anElement [

	^ self to: anElement position + aDeltaPoint during: seconds on: anElement

]

{ #category : #public }
RTLinearMove >> by: aDeltaPoint during: seconds on: anElement in: aView [

	^ self to: anElement position + aDeltaPoint during: seconds on: anElement in: aView
]

{ #category : #testing }
RTLinearMove >> hasCompleted [
	^ animatedValue hasCompleted
]

{ #category : #refreshing }
RTLinearMove >> refresh [
	element translateTo: animatedValue value.
	element signalUpdate
]

{ #category : #accessing }
RTLinearMove >> start [
	animatedValue start
]

{ #category : #public }
RTLinearMove >> to: anEndPoint during: seconds on: anElement [
	| position |
	element := anElement.
	
	position := anElement position.
	animatedValue := TRVIAnimatedValue new
							evaluator: [ :t | position interpolateTo: anEndPoint at: t ];
							timer: (TRVITimer new cycleLength: seconds);
							yourself.
	
]

{ #category : #public }
RTLinearMove >> to: anEndPoint during: seconds on: anElement in: aView [
	| anim |
	anim := self to: anEndPoint during: seconds on: anElement.
	aView addAnimation: anim
]
