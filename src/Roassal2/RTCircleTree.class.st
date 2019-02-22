"
I am a class helper to do the layout in RTCircularTreeMapBuilder
"
Class {
	#name : #RTCircleTree,
	#superclass : #RTObject,
	#instVars : [
		'x',
		'y',
		'r'
	],
	#category : #'Roassal2-Builder-CircularMap'
}

{ #category : #public }
RTCircleTree class >> centerMinus: c1 with: c0 [
	| inst |
	inst := RTVector new.
	inst x: c1 x - c0 x.
	inst y: c1 y - c0 y.
	^ inst.
]

{ #category : #public }
RTCircleTree class >> combine: c0 with: c1 [
	| vr r inst |
	vr := self centerMinus: c1 with: c0.
	vr lengthenBy: c0 r + c1 r.
	vr scaleBy: 0.5.
	r := vr magnitude.
	r >= c0 r ifTrue: [ 
		vr shortenBy: c0 r.
		vr add: c0 center.
		inst := self new.
		inst verctor: vr r: r.
		^ inst ].
	
	^ c0 r >= c1 r ifTrue: [ c0 ] ifFalse: [ c1 ].
]

{ #category : #public }
RTCircleTree class >> distanceOf: c0 and: c1 [
	| a b |
	a := c0 x - c1 x.
	b := c0 y - c1 y.
	^ ((a * a) + (b *b )) sqrt
]

{ #category : #public }
RTCircleTree class >> doIntersect: c0 with: c1 [
	^ (c1 center - c0 center) magnitude < (c0 r + c1 r - self epsilon)
]

{ #category : #public }
RTCircleTree class >> epsilon [
	^ 1.0e-0006
]

{ #category : #accessing }
RTCircleTree >> center [
	^ RTVector new x: x; y: y
]

{ #category : #accessing }
RTCircleTree >> r [
	^ r
]

{ #category : #accessing }
RTCircleTree >> r: cr [
	x := 0.
	y := 0.
	r := cr.
]

{ #category : #public }
RTCircleTree >> scaleFull: factor [
	x := x * factor.
	y := y * factor.
	r := r * factor.
]

{ #category : #public }
RTCircleTree >> translateBy: v [
	x := x + v x.
	y := y + v y.
]

{ #category : #accessing }
RTCircleTree >> verctor: v r: cr [
	x := v x.
	y := v y.
	r := cr.
]

{ #category : #accessing }
RTCircleTree >> x [
	^ x
]

{ #category : #accessing }
RTCircleTree >> x: cx y: cy r: cr [
	x := cx.
	y := cy.
	r := cr.
]

{ #category : #accessing }
RTCircleTree >> y [
	^ y
]
