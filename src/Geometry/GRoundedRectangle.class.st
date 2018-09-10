"
I represent a rectangle whose corners are rounded.
"
Class {
	#name : #GRoundedRectangle,
	#superclass : #Object,
	#instVars : [
		'rectangle',
		'borderRadius'
	],
	#category : 'Geometry'
}

{ #category : #'instance creation' }
GRoundedRectangle class >> rectangle: aRectangle borderRadius: aRadius [
	^ self new
		setRectangle: aRectangle borderRadius: aRadius;
		yourself
]

{ #category : #comparing }
GRoundedRectangle >> = aRect [
	self species = aRect species
		ifFalse: [ ^ false ].
	^ self rectangle = aRect rectangle and: [ self borderRadius = aRect borderRadius ]
]

{ #category : #accessing }
GRoundedRectangle >> borderRadius [
	^ borderRadius
]

{ #category : #accessing }
GRoundedRectangle >> center [
	^ self rectangle center
]

{ #category : #accessing }
GRoundedRectangle >> corners [
	| r |
	r := borderRadius.
	^ Array
		with:
			(GCircleArc
				center: rectangle topRight + (r negated @ r)
				radius: r
				startAngle: 0
				endAngle: Float halfPi)
		with:
			(GCircleArc
				center: rectangle topLeft + (r @ r)
				radius: r
				startAngle: Float halfPi
				endAngle: Float pi)
		with:
			(GCircleArc
				center: rectangle bottomLeft + (r @ r negated)
				radius: r
				startAngle: Float pi
				endAngle: Float threePi / 2)
		with:
			(GCircleArc
				center: rectangle bottomRight + (r negated @ r negated)
				radius: r
				startAngle: Float threePi / 2
				endAngle: Float twoPi)
]

{ #category : #accessing }
GRoundedRectangle >> encompassingRectangle [
	^ self rectangle
]

{ #category : #comparing }
GRoundedRectangle >> intersectLine: aLine [
	(self corners flatCollect: [ :each | aLine intersectCircleArc: each ])
		ifNotEmpty: [ :col | ^ col ].
	^ aLine intersectRectangle: self rectangle
]

{ #category : #comparing }
GRoundedRectangle >> intersectLineSegment: aLine [
	(self corners flatCollect: [ :each | aLine intersectCircleArc: each ])
		ifNotEmpty: [ :col | ^ col ].
	^ aLine intersectRectangle: self rectangle
]

{ #category : #accessing }
GRoundedRectangle >> rectangle [
	^ rectangle
]

{ #category : #initialization }
GRoundedRectangle >> setRectangle: aRectangle borderRadius: aRadius [
	rectangle := aRectangle.
	borderRadius := aRadius
]
