"
I am a class to move elements position in a SVG path
"
Class {
	#name : #RTPathAnimation,
	#superclass : #RTAnimation,
	#instVars : [
		'curves',
		'animatedValue',
		'index',
		'during'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #'as yet unclassified' }
RTPathAnimation class >> on: element path: aString seconds: seconds [
	^ self new
		element: element;
		path: aString;
		seconds: seconds
]

{ #category : #refreshing }
RTPathAnimation >> cubic: prev to: current at: t [
	| c0 c1 c2 c3 cp cx cy bx by ax ay tSquared tCubed x y|
	cp := (curves at: index) second.
	c0 := prev.
	c1 := cp second.
	c2 := cp third.
	c3 := current.
	
	cx := 3.0 * (c1 x - c0 x).
	bx := (3.0 * (c2 x - c1 x)) - cx.
	ax := c3 x - c0 x - cx - bx.
	
	cy := 3.0 * (c1 y - c0 y).
	by := (3.0* (c2 y - c1 y)) - cy.
	ay := c3 y - c0 y - cy - by.
	tSquared := t*t.
	tCubed := tSquared * t.
	x := (ax * tCubed) + (bx * tSquared) + (cx * t) + c0 x.
	y := (ay * tCubed) + (by * tSquared) + (cy * t) + c0 y.
	^ x@y
]

{ #category : #'as yet unclassified' }
RTPathAnimation >> duringDo: aBlock [
	during := aBlock.
]

{ #category : #accessing }
RTPathAnimation >> element: el [
	element := el.
	el attributes at: #op put: el position.
]

{ #category : #testing }
RTPathAnimation >> hasCompleted [
	^ animatedValue hasCompleted
]

{ #category : #'as yet unclassified' }
RTPathAnimation >> initialize [
	super initialize.
	during := [  ].
]

{ #category : #refreshing }
RTPathAnimation >> linear: prev to: current at: t [
	^ prev interpolateTo: current at: t .
]

{ #category : #accessing }
RTPathAnimation >> path: aString [
	| answer absolute key args p cp1 cp2 point abso |
	curves := TRSVGPath new path: aString; curves.
	answer := OrderedCollection new.
	absolute := true.
	p := 0@0.
	abso := [ :da | absolute 
		ifTrue: [ da ]
		ifFalse: [ p + da ] ].
	point := [ :da | p := absolute
		ifTrue: [ da ]
		ifFalse: [ p + da ].
		args at: 1 put: p. ].
	curves do: [ :curve |
		key := curve first.
		args := curve second.
		key = #absolute ifTrue: [ absolute := true ].
		key = #relative ifTrue: [ absolute := false ].
		key = #moveTo: ifTrue: [ point value: args first. answer add: curve. ].
		key = #lineTo: ifTrue: [ point value: args first. answer add: curve. ].
		key = #curveVia:and:to: ifTrue: [ 
			cp1 := abso value: args first.
			cp2 := abso value: args second.
			p := abso value: args third.
			args at: 1 put: p.
			args at: 2 put: cp1.
			args at: 3 put: cp2.
			answer add: curve ] ].
	curves := answer.
	
]

{ #category : #accessing }
RTPathAnimation >> position: i [
	| r |
	r := (curves at: i) second.
	^ r first.
]

{ #category : #refreshing }
RTPathAnimation >> refresh [
	| t prev current key position |
	
	curves ifEmpty: [ ^ self ].
	t := animatedValue value.
	index := (t * curves size) ceiling.
	index < 1 ifTrue: [ index := 1 ].
	current := self position: index.
	t := (t  - ((index - 1) / curves size)) / (1 / curves size).
	prev := index = 1
		ifTrue: [ element attributes at: #op  ]
		ifFalse: [ (curves at: index-1) second first ].
	key := (curves at: index) first.
	position := nil.
	((key = #moveTo:) or: [ key = #lineTo: ])
		ifTrue: [ 
			position := self
				linear: prev
				to: current
				at: t ].
	key = #curveVia:and:to:
		ifTrue: [ position := self 
			cubic: prev 
			to: current
			at: t
			 ].
	position notNil ifTrue:[
		element translateTo: position.
		during rtValue: element.
		element signalUpdate.
		].
	
]

{ #category : #accessing }
RTPathAnimation >> repeat [
	animatedValue timer repeat.
]

{ #category : #private }
RTPathAnimation >> seconds: seconds [
	animatedValue := TRVIAnimatedValue new
		evaluator: [ :t | t ];
		timer: (TRVITimer new cycleLength: seconds);
		yourself.
	


]

{ #category : #actions }
RTPathAnimation >> start [
	animatedValue start
]
