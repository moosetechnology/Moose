"
I am a utility class to help to the layout process in the RTCircularTreeMapBuilder
"
Class {
	#name : #RTGapTree,
	#superclass : #RTObject,
	#instVars : [
		'circles'
	],
	#category : #'Roassal2-Builder-CircularMap'
}

{ #category : #computing }
RTGapTree >> addGapsTo: gaps closest: closest [
	| innerGap |
	gaps add: (RTGapTree new c1: circles first c2: closest).
	gaps add: (RTGapTree new c1: closest c2: circles second).
	
	innerGap := RTGapTree new c1: circles second c2: closest.
	innerGap circles at: 3 put: circles first.
	gaps add: innerGap
]

{ #category : #accessing }
RTGapTree >> c1: circle1 c2: circle2 [
	circles at: 1 put: circle1;
		at: 2 put: circle2.
]

{ #category : #accessing }
RTGapTree >> circles [
	^ circles.
]

{ #category : #initialization }
RTGapTree >> initialize [
	super initialize.
	circles := Array new:3.
]

{ #category : #computing }
RTGapTree >> makeGapCircle: r [
	| in1 in2 r1 r2 d a h p2 x0 y0 x1 y1 x2 y2 |
	in1 := circles first.
	in2 := circles second.
	r1 := in1 r + r.
	r2 := in2 r + r.
	d := RTCircleTree distanceOf: in1 and: in2.
	(((d > (r1 + r2) ) ifTrue: [ 1 ] ifFalse: [ 0 ] ) |
	( (d < (r1 - r2) abs) ifTrue: [ 1 ] ifFalse: [ 0 ])) ~= 0 ifTrue: [ ^ nil ].
	
	a := ((r1 * r1) - (r2 * r2) + (d * d))/ (2* d).
	h := ((r1 * r1)-(a *a )) sqrt.
	
	p2 := in1 center.
	p2 add: (((RTCircleTree centerMinus: in2 with: in1) scaleBy: a) scaleBy: 1/d).
	x0 := in1 x. x1 := in2 x. x2 := p2 x.
	y0 := in1 y. y1 := in2 y. y2 := p2 y.
	
	^ RTCircleTree new 
			x: x2 + (h * (y1-y0)/ d)
			y: y2 - (h * (x1-x0)/ d) 
			r: r.
]
