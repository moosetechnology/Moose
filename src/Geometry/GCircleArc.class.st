"
I represent a circle arc described by the underlying GCircle and the start and end angle (in radians).
"
Class {
	#name : #GCircleArc,
	#superclass : #Object,
	#instVars : [
		'circle',
		'startAngle',
		'endAngle'
	],
	#category : 'Geometry'
}

{ #category : #'instance creation' }
GCircleArc class >> center: aCenter radius: aRadius startAngle: aStart endAngle: anEnd [
	^ self new
		setCircle: (GCircle center: aCenter radius: aRadius) startAngle: aStart endAngle: anEnd;
		yourself
]

{ #category : #'instance creation' }
GCircleArc class >> circle: aCircle startAngle: aStart endAngle: anEnd [
	^ self new
		setCircle: aCircle startAngle: aStart endAngle: anEnd;
		yourself
]

{ #category : #comparing }
GCircleArc >> = anArc [
	self species = anArc species
		ifFalse: [ ^ false ].
	^ self circle = anArc circle
		and: [ self startAngle = anArc startAngle and: [ self endAngle = anArc endAngle ] ]
]

{ #category : #accessing }
GCircleArc >> center [
	^ circle center
]

{ #category : #accessing }
GCircleArc >> circle [
	^ circle
]

{ #category : #accessing }
GCircleArc >> endAngle [
	^ endAngle
]

{ #category : #'as yet unclassified' }
GCircleArc >> intersectLineSegment: aLineSegment [
	^ aLineSegment intersectCircleArc: self
]

{ #category : #accessing }
GCircleArc >> radius [
	^ circle radius
]

{ #category : #initialization }
GCircleArc >> setCircle: aCircle startAngle: aStart endAngle: anEnd [
	circle := aCircle.
	startAngle := aStart.
	endAngle := anEnd
]

{ #category : #accessing }
GCircleArc >> startAngle [
	^ startAngle
]
