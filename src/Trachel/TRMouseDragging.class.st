"
When: during dragging of the element
Target: dragged element
"
Class {
	#name : #TRMouseDragging,
	#superclass : #TRAbstractMouseEvent,
	#instVars : [
		'step'
	],
	#category : #'Trachel-Events'
}

{ #category : #public }
TRMouseDragging class >> shape: aShape step: aStepAsPoint [
	^ (self shape: aShape)
		step: aStepAsPoint;
		yourself
]

{ #category : #public }
TRMouseDragging class >> step: aStepAsPoint [
	^ self new step: aStepAsPoint
]

{ #category : #initialization }
TRMouseDragging >> initialize [
	super initialize.
	step := 0 @ 0.
]

{ #category : #accessing }
TRMouseDragging >> step [
	^ step
]

{ #category : #accessing }
TRMouseDragging >> step: aPoint [
	step := aPoint
]
