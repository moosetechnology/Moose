"
An instance of RTRadar is an element to explore an see  in a small portion of the view the same visualization, with small elements.

Check examples(in RTExperimentalExample) to learn how to use a RTRadar
"
Class {
	#name : #RTRadar,
	#superclass : #RTBuilder,
	#instVars : [
		'targetView',
		'extent'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #'instance creation' }
RTRadar class >> on: aView [
	^ self new onView: aView
]

{ #category : #public }
RTRadar >> build [
	super build.
	view openInWindowSized: extent titled: 'Minimap'
]

{ #category : #accessing }
RTRadar >> extent: newExtent [
	extent := newExtent.
]

{ #category : #initialization }
RTRadar >> initialize [
	super initialize.
	extent := 250@250.
	
]

{ #category : #accessing }
RTRadar >> onView: aView [
	targetView := aView
]

{ #category : #hooks }
RTRadar >> renderIn: aView [
	| box box2 lupa boundingBox sc |
	lupa := nil.
	sc := 1.
	aView addAnimation: (RTNopAnimation new
		waitFor: 0.5; repeat; blockToExecute: [ | ext |
			sc := view canvas focusOnCenterScaled.
			lupa first translateTo: view canvas extent /2.
			ext := targetView canvas encompassingRectangle extent.
			Transcript crShow: sc.
			lupa second translateTo: view canvas extent * 
				(targetView canvas camera position ) / ext.
			lupa updateShape. ] ).
	view canvas privateShapes: targetView canvas privateShapes.
	box := RTBox new
		width: [ view canvas extent x ];
		height: [ view canvas extent y ];
		color: Color transparent.
	box2 := RTBox new
		width: [ targetView canvas extent x * sc];
		height: [ targetView canvas extent y * sc ];
		color: Color transparent;
		borderColor: Color blue.
		
	lupa := RTGroup new.
	lupa add: box element.
	lupa add: box2 element.
	lupa do: [ :e| 	view canvas addFixedShape: e trachelShape ].

	
	
]
