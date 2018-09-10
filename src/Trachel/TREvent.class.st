"
TREvent is the root of all the events handled by Trachel (and therefore Roassal).

Here is an example on how to use it:
-=-=-=
c := TRCanvas new.

shape := TRBoxShape new size: 40.
c addShape: shape.

shape when: TREvent do: [ :evt | shape color: Color random. c signalUpdate ].

c 
-=-=-=
"
Class {
	#name : #TREvent,
	#superclass : #Announcement,
	#instVars : [
		'canvas',
		'position',
		'morph'
	],
	#category : #'Trachel-Events'
}

{ #category : #accessing }
TREvent >> canvas [
	
	^ canvas
]

{ #category : #accessing }
TREvent >> canvas: aTrachelCanvas [
	"Set the Trachel canvas"
	canvas := aTrachelCanvas
]

{ #category : #initialization }
TREvent >> initialize [
	super initialize.
	position := 0 @ 0.
]

{ #category : #accessing }
TREvent >> morph [
	^ morph
]

{ #category : #accessing }
TREvent >> morph: aMorph [
	morph := aMorph
]

{ #category : #accessing }
TREvent >> position [
	
	^ position
]

{ #category : #accessing }
TREvent >> position: aPoint [
	
	position := aPoint
]

{ #category : #accessing }
TREvent >> positionFromCamera [
	"Return the position from the camera. I.e., 0 @ 0 is at the center of the window if the camera has not been translated"
	^ canvas 
		ifNotNil: [ canvas camera fromPixelToSpace: self position ]
		ifNil: [ -250 @ -250 ]

]

{ #category : #accessing }
TREvent >> signalUpdate [
	morph notNil ifTrue: [ morph changed ]
	
]
