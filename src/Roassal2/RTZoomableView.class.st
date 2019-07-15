"
I am interaction which allows view to be zoomed with a mouce wheel. While zomming mouce cursor stays on the same spot in the canvas
"
Class {
	#name : #RTZoomableView,
	#superclass : #RTAbstractInteractionView,
	#instVars : [
		'minZoom',
		'maxZoom'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #'instance creation' }
RTZoomableView class >> min: aMin max: aMax [
	^ self new
		min: aMin max: aMax;
		yourself
]

{ #category : #hooks }
RTZoomableView >> initializeElement: aView [
	aView canvas
		when: TRMouseWheelEvent
		do: [ :e | 
			self processEvent: e ]
]

{ #category : #accessing }
RTZoomableView >> maxZoom [
	^ maxZoom ifNil: [ 10 ]
]

{ #category : #accessing }
RTZoomableView >> maxZoom: aFloat [
	maxZoom := aFloat
]

{ #category : #accessing }
RTZoomableView >> min: aMinFloat max: aMaxFloat [
	self minZoom: aMinFloat.
	self maxZoom: aMaxFloat
]

{ #category : #accessing }
RTZoomableView >> minZoom [
	^ minZoom ifNil: [ 0.1 ]
]

{ #category : #accessing }
RTZoomableView >> minZoom: aFloat [
	minZoom := aFloat
]

{ #category : #hooks }
RTZoomableView >> processEvent: evt [
	| scale dist |
	dist := evt position - evt canvas camera position.
	scale := evt canvas camera scale.
			
	evt isUp ifTrue: [  
		scale * 1.25 <= self maxZoom ifTrue: [ 
			scale := scale * 1.25.
			dist := dist * 0.2 ]
		ifFalse: [ ^ self ].
		].
	evt isDown ifTrue:  [
		scale * 0.8 >= self minZoom ifTrue: [ 
			scale := scale * 0.8.
			dist := dist * -0.25 ]
		ifFalse: [ ^ self ]
	].
	evt canvas camera
		scale: scale;
		translateBy: dist.
	evt signalUpdate
]
