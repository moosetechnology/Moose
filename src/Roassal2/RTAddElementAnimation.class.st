"
I am a simple animation when an element or group of elements is added to the a view
"
Class {
	#name : #RTAddElementAnimation,
	#superclass : #RTAnimation,
	#instVars : [
		'animatedValue',
		'shape',
		'shapes',
		'numberOfShapes',
		'side',
		'center'
	],
	#category : #'Roassal2-Experimental'
}

{ #category : #accessing }
RTAddElementAnimation >> after: aBlock [
	animatedValue finishCallback: aBlock
]

{ #category : #public }
RTAddElementAnimation >> element: anElement during: seconds [
	| rect |
	element := anElement.
	rect := element encompassingRectangle.
	side := (rect extent x max: rect extent y) * 1.5.
	shapes := shape elementsOn: (1 to: numberOfShapes).
	
	anElement view addAll: shapes.
	center := rect center.
	shapes do: [ :e | 
		e extent: 0@0.
		e pushBack].
	animatedValue := TRVIAnimatedValue new
		evaluator: [ :t | t ];
		timer: (TRVITimer new cycleLength: seconds);
		yourself.
	
	self after: [ shapes do: #remove ].
]

{ #category : #testing }
RTAddElementAnimation >> hasCompleted [
	^ animatedValue hasCompleted
]

{ #category : #initialization }
RTAddElementAnimation >> initialize [
	super initialize.
	shape := RTShapeBuilder new.
	self numberOfShapes: 4.
]

{ #category : #accessing }
RTAddElementAnimation >> numberOfShapes: aNumber [
	numberOfShapes := aNumber
]

{ #category : #refreshing }
RTAddElementAnimation >> refresh [
	| t f a |
	t := animatedValue value.
	shapes doWithIndex: [ :e :i | 
		e translateTo: center.
		f := i * 0.5 / shapes size.
		(t - f) > 0 ifTrue: [ 
			a := side interpolateTo: 0 at: (t - f).
			
			e extent: a @ a  ]
		 ].
	element signalUpdate.
	
]

{ #category : #accessing }
RTAddElementAnimation >> shape [
	^ shape
]

{ #category : #actions }
RTAddElementAnimation >> start [
	animatedValue start
]
