"
I am an animation that change the position and the zoom of the camera by the value returned from #step selector
"
Class {
	#name : #RTFocusAnimation,
	#superclass : #RTAnimation,
	#instVars : [
		'canvas',
		'anime1',
		'anime2'
	],
	#category : #'Roassal2-Builder-CircularMap'
}

{ #category : #'instance creation' }
RTFocusAnimation class >> on: element [
	element view addAnimation: (self new on: element)
]

{ #category : #'as yet unclassified' }
RTFocusAnimation >> hasCompleted [
	^ anime1 hasCompleted
]

{ #category : #'instance creation' }
RTFocusAnimation >> on: ele [
	^ self on: ele during: 1
]

{ #category : #public }
RTFocusAnimation >> on: el during: seconds [
	| initialScale initialPosition finalScale finalPosition rec sc |
	canvas := el view canvas.
	initialScale := canvas camera scale.
	initialPosition := canvas camera position.
	
	rec := el encompassingRectangle.
	finalPosition := rec center.
	sc :=canvas extent / (rec extent * 1.1).
	finalScale := (sc x < sc y ) ifTrue: [sc x] ifFalse: [sc y].
	
	anime1 := TRVIAnimatedValue new 
		evaluator: [ :t | initialScale interpolateTo: finalScale at: t ];
		timer: (TRVITimer new cycleLength: seconds);
		yourself.
	anime2 := TRVIAnimatedValue new
		evaluator: [ :t | initialPosition interpolateTo: finalPosition at: t ];
		timer: (TRVITimer new cycleLength: seconds);
		yourself.
	
]

{ #category : #'as yet unclassified' }
RTFocusAnimation >> refresh [
	canvas camera scale: anime1 value.
	canvas camera translateTo: anime2 value.
	canvas signalUpdate
]

{ #category : #'as yet unclassified' }
RTFocusAnimation >> start [
	anime1 start.
	anime2 start.
	canvas signalUpdate.
]
