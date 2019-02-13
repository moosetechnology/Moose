Class {
	#name : #RTRotationMove,
	#superclass : #RTAnimation,
	#instVars : [
		'animatedValue'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #'as yet unclassified' }
RTRotationMove class >> angle: anAngle during: seconds on: shape [
	^ self new angle: anAngle during: seconds on: shape
]

{ #category : #public }
RTRotationMove >> angle: anAngle during: seconds on: anElement [
	|currentAngle|
	element := anElement.
	currentAngle := element trachelShape angleInDegrees.
	animatedValue := TRVIAnimatedValue new
							evaluator: [ :t | currentAngle interpolateTo: anAngle at: t ];
							timer: (TRVITimer new cycleLength: seconds);
							yourself.
]

{ #category : #testing }
RTRotationMove >> hasCompleted [
	^ animatedValue hasCompleted
]

{ #category : #refreshing }
RTRotationMove >> refresh [
	element trachelShape rotateToDegrees: animatedValue value.
	"element update."
	element signalUpdate.
]

{ #category : #actions }
RTRotationMove >> start [
	animatedValue start
]
