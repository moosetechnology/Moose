"
I am a triangle
"
Class {
	#name : #GTriangle,
	#superclass : #Object,
	#instVars : [
		'v1',
		'v2',
		'v3',
		'edgesByOpositeVertex'
	],
	#category : 'Geometry'
}

{ #category : #'as yet unclassified' }
GTriangle class >> with: aPoint1 with: aPoint2 with: aPoint3 [
	^ self new initializeWith: aPoint1 with: aPoint2 with: aPoint3
]

{ #category : #properties }
GTriangle >> area [
	| semiperimeter|
	semiperimeter := self semiperimeter.

	^ (self edges 
		inject: semiperimeter
		into: [ :subProduct :edge |
			(semiperimeter - edge length) * subProduct ]) sqrt
]

{ #category : #figures }
GTriangle >> circumscribedCircle [
	| center radius |
	center := self edges first perpendicularBisector intersect: self edges last perpendicularBisector.
	center isNil ifTrue: [ ^nil ] ifFalse: [ radius := (v1 dist: v2) * (v2 dist: v3) * (v3 dist: v1) / (4 * self area).
		^GCircle center: center radius: radius ] 
	
	"^ GCircle
		center:
			(self edges first perpendicularBisector intersect:
			 self edges last perpendicularBisector)
		radius: (v1 dist: v2) * (v2 dist: v3) * (v3 dist: v1) / (4 * self area)"
]

{ #category : #accessing }
GTriangle >> edges [
	^ self edgesByOpositeVertex values
]

{ #category : #accessing }
GTriangle >> edgesByOpositeVertex [

	^ edgesByOpositeVertex ifNil: [
		edgesByOpositeVertex := {
			v1 -> (GSegment with: v2 with: v3) .
			v2 -> (GSegment with: v3 with: v1) .
	   		v3 -> (GSegment with: v1 with: v2)  } asDictionary ]
]

{ #category : #properties }
GTriangle >> hasTwoIntersectionWithSegm: segm [
	|i|
	i := 0.
	self edges do:[:e | (e intersect: segm) isNotNil ifTrue:[ i := i + 1 ] ].
	^ (i = 2 or:[ i = 3])
]

{ #category : #initialization }
GTriangle >> initializeWith: aPoint1 with: aPoint2 with: aPoint3 [
	super initialize.
	v1 := aPoint1.
	v2 := aPoint2.
	v3 := aPoint3 
]

{ #category : #figures }
GTriangle >> isDegenerate [
(v1 = v2 or:[ v1 = v3 or:[ v2 = v3 ]])
	ifTrue:[^ true]
	ifFalse:[
	^  (self edges first length + self edges second length ="closeTo:" (self edges third length)) or: [ 
		(self edges second length + self edges third length ="closeTo:" (self edges first length)) or: [ 
		 self edges third length + self edges first length ="closeTo:" (self edges second length) ] ]]
]

{ #category : #properties }
GTriangle >> perimeter [
	^ self edges
		inject: 0
		into: [ :subSum :edge |
			subSum + edge length ]
]

{ #category : #properties }
GTriangle >> semiperimeter [
	^ self perimeter / 2
]

{ #category : #accessing }
GTriangle >> vertices [

	^ { v1 . v2 . v3 }
]
