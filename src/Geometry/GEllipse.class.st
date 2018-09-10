"
I am an Ellipse geometry.

I am described by center and two radii.

- `center `is the center point of the ellipse
- `a` is the major radius along the x axis
- `b` is the minor radius along the y axis
"
Class {
	#name : #GEllipse,
	#superclass : #Object,
	#instVars : [
		'center',
		'a',
		'b'
	],
	#category : 'Geometry'
}

{ #category : #'instance creation' }
GEllipse class >> center: aPoint a: xRadius b: yRadius [
	^ self new setCenter: aPoint a: xRadius b: yRadius
]

{ #category : #comparing }
GEllipse >> = anEllipse [
	self species = anEllipse species
		ifFalse: [ ^ false ].
	^ self center = anEllipse center & (self a = anEllipse a) & (self b = anEllipse b)
]

{ #category : #accessing }
GEllipse >> a [
	^ a
]

{ #category : #accessing }
GEllipse >> b [
	^ b
]

{ #category : #accessing }
GEllipse >> center [
	^ center
]

{ #category : #accessing }
GEllipse >> encompassingRectangle [
	^ center - (a @ b) corner: center + (a @ b)
]

{ #category : #comparing }
GEllipse >> hash [
	^ (a bitXor: b) bitXor: center hash
]

{ #category : #'as yet unclassified' }
GEllipse >> intersectLineSegment: aLineSegment [
	^ aLineSegment intersectEllipse: self
]

{ #category : #initialization }
GEllipse >> setCenter: aCenter a: xRadius b: yRadius [
	center := aCenter.
	a := xRadius.
	b := yRadius
]
